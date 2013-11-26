namespace :assignments do
  task :initiate => :environment do
    puts "Initiate assignment"
    if Time.now > assignment.datetime_to_send
      # mark as started
      # send first message to all students
    end
  end
end