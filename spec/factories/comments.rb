# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    association :answer, factory: :answer
    body Faker::Company.bs
  end
end

