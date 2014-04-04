class Question < ActiveRecord::Base


  validates :title, presence: true, uniqueness: true

  validates_presence_of :description, message: "must be present"

  after_initialize :set_defaults


  default_scope {order ("title ASC") }

  has_one :question_detail
  # Methods for manipulating question_detail DB:
  # ~> question.build_question_detail(notes: "hello")
  # ~> question.create_question_detail(notes: "hello")

  has_many :answers, dependent: :destroy
  # question.answers(notes: "hello")



  has_many :comments, through: :answers
  #makes Answer DB schema dependent on Question schema


###########SAME THING BELOW: scope and self.recent_ten #############
  # scope :recent_ten, -> { order("created_at DESC").limit(10) }
  # ## -> sign is same as lambda

# OR


  def self.recent_ten
    order("created_at DESC").limit(10)
  end
##########

#Difference between method 1 and 2:  "x" is a variable you can define the number of DB entries to print

###########SAME THING BELOW:  scope and self.recent(x)

  scope :recent, lambda {|x| order("created_at DESC").limit(x) }



# OR

  # def self.recent(x)
  #     order("created_at DESC").limit(x)
  # end
###########################

scope :after, lambda {|date| where(["created_at DESC"]).limit(x) }
##DEBUG NOTE: Above added as Copy from Tam's app

before_save :capitalize_title

  private

  def capitalize_title
    self.title.capitalize!
  end

  def set_defaults 
  end

end
  #makes title inputs capitalized in database