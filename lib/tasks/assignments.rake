namespace :assignments do
  task :initiate => :environment do
    # mark as started
    puts "Initiate assignment"
    @assignments = Assignment.all.select do |assignment|
      unless assignment.datetime_to_send.nil?
        (Time.now > assignment.datetime_to_send) && assignment.sent_at.nil?
      end
    end

    @assignments.each do |assignment|
      puts "TEST: sending #{assignment.name}..."
      assignment.students.each do |student|
        message_to_send = Message.create(
                          from: assignment.teacher.phone_number,
                          to: student.phone_number,
                          content: assignment.description,
                          assignment: assignment,
                          student: student)

        # do not reset current assignment if the student is on another assignment
        unless student.current_assignment
          student.update(current_assignment: assignment.id)
        end

        message_to_send.send_text_message
        assignment.update(sent_at: Time.now)

        puts "  sending to #{student.name} #{student.phone_number}"
      end
    end
  end
end