class AssignmentResponseHandler

  def run(from, body)
    student_phone_number = from.slice(2..-1)
    student = Student.find_by(phone_number: student_phone_number)

    student.record_answer(body)
    student.send_next_question!

    # if input.strip.downcase == "ready"
    #   # we need to retrieve the next question?
    #   if student.current_assignment
    #     @assignment = Assignment.find(@student.current_assignment)
    #     if student.current_question
    #       @next_question = student.next_question
    #         if @next_question
    #           message = Message.create(
    #                     from: @assignment.teacher.phone_number,
    #                     to: @student.phone_number,
    #                     content: @next_question.content,
    #                     assignment: @assignment,
    #                     student: @student)

    #           message.send_text_message
    #           student.current_question = @next_question.id
    #           student.save
    #         end
    #       end
    #     end
    #   else #student.current_assignment is nil
    #     if student.incomplete_assignments
    #       assignments_list = student.incomplete_assignments.each_with_index.map {|assignment, i|  "#{i}. #{assignment.name}"}
    #       content = "Your assignments: #{assignments_list}. Please reply SWITCH #"

    #       # send a message
    #       # with list and task which assignment?
    #       message = Message.create(
    #                 from: ???,
    #                 to: @student.phone_number,
    #                 content: content,
    #                 assignment: @assignment,
    #                 student: @student)
    #     else
    #       # send a message that they have no assignments (or all assignments complete)
    #     end
    #   end
    # else
    # end
  end
end
