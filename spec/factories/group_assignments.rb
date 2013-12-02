# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_assignment, :class => 'GroupAssignments' do
    assignment nil
    group nil
  end
end
