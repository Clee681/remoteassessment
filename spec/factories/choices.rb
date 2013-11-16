# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :choice do
    content "MyString"
    option "MyString"
    correctness false
    question nil
  end
end
