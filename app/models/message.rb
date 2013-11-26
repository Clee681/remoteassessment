class Message < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student

  def send_text_message
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']

    @client.account.sms.messages.create(
      :from => "+1#{self.from}",
      :to => "+1#{self.to}",
      :body => "#{self.content}"
    )

    self.sent_at = Time.now
    self.save
  end

  def self.test_receive_answer
    binding.pry
    # grab the from field
    # remove the +1 which twilio adds
    # compare to database
    # create an Answer object which belongs to the user
    # with that phone number

    student_phone = params["From"][2..-1].to_i
    student = Student.find_by(:phone_number => student_phone)
    q = student.answers.count + 1
    question = Question.find(q)
    Answer.create(student: student, question: question, response: params["Body"])
  end

  def self.find_next_message(student, assignment)
    Message.where(student: student, assignment: assignment).order("order ASC").limit(1)
  end

end
