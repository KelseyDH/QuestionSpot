class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


#user ERD interactions with models
has_many :questions

# dependency to add when likes are added.
# has_many :likes
# has_many :liked_questions, through: :likes, source: :questions

has_many :answers

  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}".squeeze(" ").strip
    else
      email
    end
  end
end
