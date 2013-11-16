# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :assignment do
    name "MyString"
    description "MyString"
    datetime_to_send "2013-11-16 15:51:37"
    teacher nil
  end
end
