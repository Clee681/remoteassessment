class AssignmentResponseHandler

  def run(from, to, body)
    student_phone_number = from.slice(2..-1)
    student = Student.find_by(phone_number: student_phone_number)

    teacher_phone_number = to.slice(2..-1)
    teacher = Teacher.find_by(phone_number: teacher_phone_number)
    # Retrieve assignments only for respective teacher
    teacher_assignment_ids = teacher.assignment.map do |assignment|
      assignment.id
    end

    # student.screen_response(body)
    # student.send_incomplete_assignments!
    student.record_answer(body)
    student.send_next_question!
  end
end


# if current_assignment is nil (current_question should also be nil)
# then we should send back the list of outstanding assignments for
# that student. student can text back which assignment they want
# to complete. set the respective current_assignment. retrieve
# all of the answers recorded for that respective assignment.
# send the next question.

# screen_response (checks to see if current_assignment is nil)
# check if response is setting an assignment (flag in student table?)
# set the current_assignment
# otherwise send_assignment_list
# if current_assignment is not nil
# record_answer
# send_next_question

# need to add migration in order to track if the incoming
# response from the student is supposed to set the
# current_assignment

# iterate over incomplete assignments for a given student
# add the numeric prefix for the assignment
# compose sms message
