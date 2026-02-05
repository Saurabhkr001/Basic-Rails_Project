class User < ApplicationRecord
  has_many :books, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["id", "email", "name", "created_at", "updated_at"]
  end

  def admin?
    self.admin == true
  end

end