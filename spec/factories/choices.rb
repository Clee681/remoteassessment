require 'faker'
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :choice do 
      content { Faker::Lorem.sentence[0,20] }

    factory :wrong_choice do
      correctness false
    end

    factory :correct_choice do
      correctness true
    end
  end
end
