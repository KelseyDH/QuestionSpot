# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    
    sequence(:email) {|n| "some_email#{n}@awesomeanswers.com"}
    #Above replaces:
    #email Faker::Internet.email

    password Faker::Internet.password(10) #10 is minimum pw length


  end
end
