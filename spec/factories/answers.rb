# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    association :user, factory: :user
    association :question, factory: :question
    body Faker::Company.bs
  end
end

##Old FactoryGirl
# FactoryGirl.define do
#   factory :answer do
#     association :answer, factory: :answer
#     body Faker::Company.bs
#   end
# end

