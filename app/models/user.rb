class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


#user ERD interactions with models
has_many :questions

#Note syntax "voted_questions" is a rails convention for models
has_many :votes, dependent: :destroy
has_many :voted_questions, through: :votes, source: :questions

has_many :favourites, dependent: :destroy
has_many :favourited_questions, through: :favourites, source: :questions


# dependency to add when likes are added.
# has_many :likes
# has_many :liked_questions, through: :likes, source: :questions

has_many :answers
  # vote_for acts in questions controller
  def vote_for(question)
    Vote.where(question: question, user: self).first
  end

  def favourite_for(question)
    favourites.where(question: question).first 
  end  

##Method below is same as above, but a useful method with slightly different uses
  # def has_favorited?(question)
  # favourited_questions.include? question
  # end

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
  end

end
