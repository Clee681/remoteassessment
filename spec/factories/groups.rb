# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "English Class"
    association :teacher

    factory :full_class do 
      after(:create) do |group|
        5.times do |s|
          group.students << FactoryGirl.create(:student)
        end
      end
    end
  end
end
