# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    association :user, factory: :user
    sequence(:title) {|n| "#{Faker::Company.bs} #{n}"} 
    #Above replaces below, preventing duplicate titles being generated
    # title Faker::Company.bs
    description Faker::Lorem.paragraph
  end
end
