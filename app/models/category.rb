class Category < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :storage
  validates :name, presence: { message: "must be given please" }
  validates :name, uniqueness: { message: "has been taken already" }
end
