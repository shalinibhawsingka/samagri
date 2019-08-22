class Brand < ApplicationRecord
  has_many :items
  validates :name, presence: { message: "must be given please" }
  validates :name, uniqueness: { message: "has been taken already" }
end
