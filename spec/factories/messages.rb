# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    from "MyString"
    to "MyString"
    content "MyString"
    assignment nil
    order 1
  end
end
