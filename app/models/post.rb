class Post < ApplicationRecord
  belongs_to :item

  has_attached_file :image_or_pdf
  validates_attachment_content_type :image_or_pdf, content_type: ["image/jpeg", "image/png", "application/pdf", "application/msword"]
end
