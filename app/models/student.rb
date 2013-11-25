class Student < ActiveRecord::Base
  has_many :student_groups
  has_many :groups, :through => :student_groups

  has_many :teachers, :through => :groups

  has_many :student_assignments
  has_many :assignments, :through => :student_assignments

  has_many :answers
  
end
