class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content, presence: true, length: {maximum: 200}
  scope :newest, -> {order(created_at: :desc)}

  delegate :fullname, to: :user
end
