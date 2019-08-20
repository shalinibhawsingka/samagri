class Item < ApplicationRecord
  cattr_accessor :current_user

  belongs_to :brand, optional: true
  belongs_to :category
  belongs_to :employee, optional: true

  has_many :posts, dependent: :destroy
  has_many :storage
  has_many :issues

  
end
