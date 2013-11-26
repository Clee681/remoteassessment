class AssignmentResponseHandler

  def run(from, body)
    student_phone_number = from.slice(2..-1)
    student = Student.find_by(phone_number: student_phone_number)

    student.record_answer(body)
    student.send_next_question!
  end
end