class Student < ActiveRecord::Base
  has_many :student_groups
  has_many :groups, :through => :student_groups

  has_many :teachers, :through => :groups

  has_many :student_assignments
  has_many :assignments, :through => :student_assignments
  has_many :incomplete_assignments, -> { where("completed=null") }, class_name: 'StudentAssignment'

  has_many :answers
  has_many :messages

  def next_question
    assignment = Assignment.find(self.current_assignment)
    questions = assignment.questions.order("sequence ASC")

    if self.current_question == nil
      # current question is #1
      self.current_question = questions.first.id
      self.save
      questions.first
    else
      # get next question based on question order and the current_question
      question = Question.find(self.current_question)
      new_index = questions.index(question).next

      if questions[new_index].nil?
        self.current_question = nil
      else
        self.current_question = questions[new_index].id
      end
      
      self.save
      questions[new_index]
    end
  end
end
