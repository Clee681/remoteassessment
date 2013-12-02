class Group < ActiveRecord::Base
  belongs_to :teacher
  
  has_many :student_groups
  has_many :students, :through => :student_groups

  has_many :group_assignments
  has_many :assignments, :through => :group_assignments
end
