require 'faker'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    email { Faker::Internet.email } 
    phone_number { Faker::PhoneNumber.phone_number }
    password "qwerty123"
  end
end
