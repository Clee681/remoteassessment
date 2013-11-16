class Assignment < ActiveRecord::Base
  belongs_to :teacher

  has_many :student_assignments
  has_many :students, :through => :student_assignments

  has_many :questions
end
