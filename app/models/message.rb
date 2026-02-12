class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  
  # Optional: Helper to find the recipient
  def recipient
    @recipient ||= User.find_by(id: recipient_id)
  end
end