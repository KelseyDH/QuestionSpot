class Favourite < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates :user_id, uniqueness: {scope: :question_id}
  #prevents users from favouriting any single question more than once
end
