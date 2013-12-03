class GroupAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :group

  def student_progress
    total_students = 0
    finished_students = 0

    self.group.students.each do |student|
      total_students += 1

      respective_assignment = student.student_assignments.where(assignment_id: self.assignment)

      if respective_assignment.first.completed == true
        finished_students += 1
      end

      finished_students/total_students
    end
  end
end
