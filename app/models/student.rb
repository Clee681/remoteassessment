class Student < ActiveRecord::Base
  has_many :student_groups
  has_many :groups, :through => :student_groups

  has_many :teachers, :through => :groups

  has_many :student_assignments
  has_many :assignments, :through => :student_assignments

  has_many :answers
  has_many :messages

  def incomplete_assignments(teacher_assignments)
    self.student_assignments.where(completed: [nil, false], assignment_id: teacher_assignments)
  end

  def has_incomplete_assignments?(teacher_assignments)
    self.incomplete_assignments(teacher_assignments).size > 0
  end

  def asking_for_assignments?(body)
    body.strip.downcase == "list" || self.current_assignment.nil?
  end

  def starting_an_assignment?(body)
    body.strip.downcase == "start" && !self.current_assignment.nil?
  end

  def send_incomplete_assignments!(teacher_assignments)
    message = self.incomplete_assignments(teacher_assignments).each_with_index.map do |incomplete_assignment, index|
      incomplete_assignment.update(list_id: index+1)
      "#{index+1}. #{incomplete_assignment.assignment.name}"
    end.join("; ")

    teacher = Assignment.find(teacher_assignments.first).teacher
    self.update(resetting_assignment: true)

    Message.create(
        from: teacher.phone_number,
        to: self.phone_number,
        content: message,
        student: self
      ).send_text_message
  end

  def send_no_assignments_message!(teacher_phone_number)
    Message.create(
        from: teacher_phone_number,
        to: self.phone_number,
        content: "There are no incomplete assignments.",
        student: self
      ).send_text_message
  end

  def send_completed_assignment_message!
    teacher = Assignment.find(self.current_assignment).teacher

    Message.create(
        from: teacher.phone_number,
        to: self.phone_number,
        content: "All done! Thank you for taking the remote assessment!",
        student: self
      ).send_text_message
  end

  def resume_assignment(body, teacher_assignments)
    student_assignment_array = self.incomplete_assignments(teacher_assignments).where(list_id: body.to_i)
    self.update(current_assignment: student_assignment_array.first.assignment.id, resetting_assignment: false)
    self.set_current_question
  end

  def send_next_question!
    if self.next_question
      Message.create(
        from: self.next_question.assignment.teacher.phone_number,
        to: self.phone_number,
        content: self.next_question.content,
        assignment: self.next_question.assignment,
        student: self
      ).send_text_message

      self.update(current_question: self.next_question.id)
    else
      student_assignment = self.student_assignments.where(assignment_id: self.current_assignment)
      student_assignment.first.update(completed: true, list_id: nil)
      student_assignment.first.grade_student_assignment
      self.send_completed_assignment_message!
      self.update(current_assignment: nil, current_question: nil)
    end
  end

  def send_current_question!
    if self.current_question
      question = Question.find(self.current_question)

      Message.create(
        from: question.assignment.teacher.phone_number,
        to: self.phone_number,
        content: question.content,
        assignment: question.assignment,
        student: self
      ).send_text_message
    end
  end

  def record_answer(answer)
    question = Question.find(self.current_question)
    correctness = (answer == question.correct_answer)
    self.answers.create(question: question, response: answer, correct: correctness)
  end

  def set_current_question
    assignment = Assignment.find(self.current_assignment)
    questions = assignment.questions.order("sequence ASC")
    question_ids = questions.map { |question| question.id }

    respective_answers = self.answers.where(question_id: question_ids)
    answer_count = respective_answers.size

    if respective_answers.empty?
      self.update(current_question: questions.first.id)
    elsif questions[answer_count]
      self.update(current_question: questions[answer_count].id)  
    end
  end

  def next_question
    assignment = Assignment.find(self.current_assignment)
    questions = assignment.questions.order("sequence ASC")

    if self.current_question == nil
      # current question is #1
      questions.first
    else
      # get next question based on question order and the current_question
      question = Question.find(self.current_question)
      new_index = questions.index(question).next
      questions[new_index]
    end
  end
end
