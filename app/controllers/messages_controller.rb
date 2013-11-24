class MessagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

=begin
=> {"AccountSid"=>"ACa194ec6c151ef1e99bfec90e4836d138",
 "MessageSid"=>"SMf15a4b851e0fa1f00743ff220a1ba088",
 "Body"=>"Patrick number",
 "ToZip"=>"80216",
 "ToCity"=>"DENVER",
 "FromState"=>"CA",
 "ToState"=>"CO",
 "SmsSid"=>"SMf15a4b851e0fa1f00743ff220a1ba088",
 "To"=>"+13036257938",
 "ToCountry"=>"US",
 "FromCountry"=>"US",
 "SmsMessageSid"=>"SMf15a4b851e0fa1f00743ff220a1ba088",
 "ApiVersion"=>"2010-04-01",
 "FromCity"=>"LOS ANGELES",
 "SmsStatus"=>"received",
 "NumMedia"=>"0",
 "From"=>"+12132158528",
 "FromZip"=>"90249",
 "controller"=>"messages",
 "action"=>"test_receive_answer"}
=end


  def send_text_message
  end

  def test_send_action
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    question = Question.first.content
    teacher_number = Teacher.first.phone_number

    students_array = Student.all.map do |student|
      student
    end

    students_array.each do |student|
      @client.account.sms.messages.create(
        :from => teacher_number,
        :to => "+1#{student.phone_number}",
        :body => "Hi, #{student.name}! #{question}"
      )
    end

    redirect_to root_path
  end

  def test_receive_answer
    binding.pry
    # grab the from field
    # remove the +1 which twilio adds
    # compare to database
    # create an Answer object which belongs to the user
    # with that phone number

    # "From"=>"+12132158528",


    student_phone = params["From"][2..-1].to_i
    student = Student.find_by(:phone_number => student_phone)
    q = student.answers.count + 1
    question = Question.find(q)
    Answer.create(student: student, question: question, response: params["Body"])
    binding.pry


    #raise params
  end


end
