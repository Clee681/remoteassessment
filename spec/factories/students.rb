# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    name { Faker::Name.first_name }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
