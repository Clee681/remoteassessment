# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    response "MyString"
    correct false
    question nil
    student nil
  end
end
