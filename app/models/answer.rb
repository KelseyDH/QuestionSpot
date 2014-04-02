class Answer < ActiveRecord::Base
  belongs_to :question
##Answer class was created in console with command line statement:
## ~> rails g model answer body:text question:references
validates_presence_of :body, message: "answer must contain text"

end