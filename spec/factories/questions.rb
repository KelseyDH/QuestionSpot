# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title Faker::Company.bs
    description Faker::Lorem.sentence
  end
end
