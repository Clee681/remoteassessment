require 'twilio-ruby'
require 'sinatra'
 
get '/responder' do
  sender = params[:From]

  twiml = Twilio::TwiML::Response.new do |response|
    response.Message "Next Question"
  end
  twiml.text
end