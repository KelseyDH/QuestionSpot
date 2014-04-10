class Vote < ActiveRecord::Base
  

  belongs_to :question
  belongs_to :user
  #Created with command line:  ~>rails g resource vote is_up:boolean question:references user:references

  validates :question_id, uniqueness: {scope: :user_id}

end
