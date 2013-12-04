class Assignment < ActiveRecord::Base
  belongs_to :teacher

  has_many :student_assignments
  has_many :students, :through => :student_assignments

  has_many :questions
  has_many :messages

  has_many :group_assignments
  has_many :groups, :through => :group_assignments
  
  def sent?
    !self.sent_at.nil?
  end
end
