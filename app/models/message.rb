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

  def self.find_next_message(student, assignment)
    Message.where(student: student, assignment: assignment).order("order ASC").limit(1)
  end

end
