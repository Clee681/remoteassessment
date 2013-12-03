class StudentAssignment < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment

  def grade_student_assignment
    question_ids = self.assignment.questions.map do |question|
      question.id
    end

    respective_answers = self.student.answers.where(question_id: question_ids)

    total_number_of_questions = respective_answers.count
    number_of_correct_answers = respective_answers.select { |answer| answer.correct == true }.count

    self.update(grade: number_of_correct_answers/(total_number_of_questions.to_f))
  end
end
