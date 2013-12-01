class Student < ActiveRecord::Base
  has_many :student_groups
  has_many :groups, :through => :student_groups

  has_many :teachers, :through => :groups

  has_many :student_assignments
  has_many :assignments, :through => :student_assignments
  # has_many :incomplete_assignments, -> { where("completed=null") }, class_name: 'StudentAssignment'

  has_many :answers
  has_many :messages

  def incomplete_assignments(teacher_assignments)
    self.student_assignments.where(completed: nil, assignment_id: teacher_assignments)
  end

  def incomplete_assignments?(teacher_assignments)
    self.incomplete_assignments(teacher_assignments).size == 0 ? false : true
  end

  def send_incomplete_assignments!(teacher_assignments)
    message = self.incomplete_assignments(teacher_assignments).each_with_index.map do |incomplete_assignment, index|
      "#{index+1}. #{incomplete_assignment.assignment.name}"
    end.join("; ")

    teacher = Assignment.find(teacher_assignments.first).teacher

    Message.create(
        from: teacher.phone_number,
        to: self.phone_number,
        content: message,
        student: self
      ).send_text_message
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
      student_assignment.completed = true
      student_assignment.save
      self.update(current_assignment: nil, current_question: nil)
    end
  end

  def screen_response(answer)
    if self.current_assignment.nil?
      # response should set current_assignment
    end
  end

  def record_answer(answer)
    question = Question.find(student.current_question)
    correctness = (answer == question.correct_answer)
    self.answers.create(question: question, response: answer, correct: correctness)
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
