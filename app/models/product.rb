class Product < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  belongs_to :category
  has_many :comments
  has_many :order_details

  validates :name, presence: true, uniqueness:true, length: {maximum: 50}
  validates :quantity, numericality: true, allow_nil: true
  validates :price, numericality: true, allow_blank: true
  validates :category_id, presence: true
end
