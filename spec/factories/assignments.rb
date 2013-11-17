# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    name "Chapter 1 Homework"
    description "Basic Geography"
    datetime_to_send "2013-11-16 15:51:37"
    #association :group
    association :teacher
  end
end
