require 'twilio-ruby'

account_sid = ""
auth_token = ""
teacher_number = "3036257938"  #teacher.new

client = Twilio::REST::Client.new account_sid, auth_token
 
question = "What is the capital of New York?"
 
students_hash = {
  "2132158528" => "Chris",
  "4042453509" => "Scott"
}

students_hash.each do |number, name|
  client.account.messages.create(
    :from => teacher_number,
    :to => number,
    :body => "Hey #{name}, todays question is: #{question}"
  ) 
  puts "#{name}: message sent"
end







