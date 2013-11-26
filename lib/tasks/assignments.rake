namespace :assignments do
  task :initiate => :environment do
    # mark as started
    puts "Initiate assignment"
    @assignments = Assignment.all.select { |assignment| Time.now > assignment.datetime_to_send }
    @assignments.each do |assignment|
      puts "TEST: sending #{assignment.name}..."
      assignment.students.each do |student|
        # send assignment description (i.e. the first message) to all students
        
        puts "  sending to #{student.name} #{student.phone_number}"
        # delete the respective row in the student_assignments row
      end
    end
  end
end