class Todo < ActiveRecord::Base
  validates_presence_of :title

  before_save :capitalize_title

  private

  def capitalize_title
    self.title.capitalize!
  end

end
