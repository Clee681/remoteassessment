class GroupAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :group
end
