namespace :assignments do
  task :initiate => :environment do
    puts "Initiate assignment"
    @assignments = Assignment.all.select { |assignment| Time.now > assignment.datetime_to_send }
    @assignments.each do |assignment|
      puts "TEST: sending #{assignment.name}..."
      assignment.students.each do |student|
        puts "  sending to #{student.name} #{student.phone_number}"
      end
    end
    # mark as started
    # send first message to all students
  end
end