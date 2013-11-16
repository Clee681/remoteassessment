class Student < ActiveRecord::Base
  belongs_to :group
  has_many :teachers, :through => :groups

  has_many :student_assignments
  has_many :assignments, :through => :student_assignments

  has_many :answers
  
end
