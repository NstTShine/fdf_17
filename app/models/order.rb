class Order < ActiveRecord::Basebelongs_to :user
  belongs_to :user
  has_many :order_details, dependent: :destroy
end
