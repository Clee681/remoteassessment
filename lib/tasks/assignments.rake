namespace :assignments do
  task :initiate => :environment do
    # mark as started
    puts "Initiate assignment"
    @assignments = Assignment.all.select { |assignment| Time.now > assignment.datetime_to_send }
    @assignments.each do |assignment|
      puts "TEST: sending #{assignment.name}..."
      assignment.students.each do |student|
        # send assignment description (i.e. the first message) to all students
        message = Message.find_next_message(student, assignment)
        message.send_text_message
        puts "  sending to #{student.name} #{student.phone_number}"
      end
    end
  end
end