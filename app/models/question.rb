class Question < ActiveRecord::Base
  belongs_to :assignment
  has_many :choices
  has_many :answers

  validates_presence_of :content, :correct_answer
  validates_length_of :content, within: 1..160
  validates_length_of :correct_answer, within: 1..160
end
