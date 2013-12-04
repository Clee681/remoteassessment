class StudentGroup < ActiveRecord::Base
  belongs_to :student
  belongs_to :group

  validates_uniqueness_of :student_id, scope: :group_id
end
