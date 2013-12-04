class GroupAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :group

  def group_progress_percentage
    total_students = 0
    finished_students = 0

    self.group.students.each do |student|
      respective_assignment = student.student_assignments.where(assignment_id: self.assignment)

      unless respective_assignment.empty?
        total_students += 1
        
        if respective_assignment.first.completed == true
          finished_students += 1
        end
      end
    end

    finished_students/(total_students.to_f)
  end

  def group_progress_integer
    (self.group_progress_percentage * 100).to_i
  end
end
