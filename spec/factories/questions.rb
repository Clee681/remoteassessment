require 'faker'

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    content "What is the capital of the US?"
    association :assignment

    after(:create) do |question|
      3.times do
        question.choices << FactoryGirl.create(:wrong_choice)
      end

      question.choices << create(:correct_choice)
    end
    
  end
end
