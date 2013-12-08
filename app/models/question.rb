class Question < ActiveRecord::Base
  belongs_to :assignment
  has_many :choices
  has_many :answers

  validates_presence_of :content, :correct_answer
  validates_length_of :content, within: 1..160
  validates_length_of :correct_answer, within: 1..160

  def total_answers
    answers.count.to_f
  end

  def correct_answers
    answers.where(correct: true).count
  end

  def wrong_answers
    answers.where(correct: false).count
  end

  def percent_correct
    if total_answers == 0
      return 0
    else
      (correct_answers/total_answers*100).to_i
    end
  end

  def percent_wrong
    100-percent_correct
  end
end
