namespace :assignments do
  task :initiate => :environment do
    # mark as started
    puts "Initiate assignment"
    @assignments = Assignment.all.select { |assignment| Time.now > assignment.datetime_to_send }
    @assignments.each do |assignment|
      puts "TEST: sending #{assignment.name}..."
      assignment.students.each do |student|
        message_to_send = Message.create(
                          from: assignment.teacher.phone_number,
                          to: student.phone_number,
                          content: assignment.description,
                          assignment: assignment,
                          student: student)

        # do not reset current assignment if the student has another assignment in progress
        unless student.current_assignment
          student.current_assignment = assignment.id
          student.save
        end

        message_to_send.send_text_message

        puts "  sending to #{student.name} #{student.phone_number}"
      end
    end
  end
end