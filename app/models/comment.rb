class Comment < ActiveRecord::Base
  belongs_to :answer

  validates :body, presence: true, length: {minimum: 3}

  scope :recent_ten, -> { limit(10).order("created_at DESC")}

  before_save :sanitize, :capitalize

  def sanitize
    self.body = body.squeeze(" ").strip
  end

  def capitalize
    self.body = body.capitalize!
  end

end
