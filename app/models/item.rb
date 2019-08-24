class Item < ApplicationRecord
  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to :employee, optional: true

  has_many :posts, dependent: :destroy
  has_many :issues, dependent: :destroy

  validates :name, presence: { message: "must be given please" }
  validates :name, uniqueness: { message: "has been taken already" }
end
