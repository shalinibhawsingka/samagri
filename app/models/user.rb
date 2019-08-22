class User < ApplicationRecord
  has_many :issues
  validates :name, presence: { message: "must be given please" }
  validates :name, uniqueness: { message: "has been taken already" }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
