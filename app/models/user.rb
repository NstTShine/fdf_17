class User < ActiveRecord::Base
  has_many :requests
  has_many :comments
  has_many :orders

  validates :fullname, presence: true, length: {maximum: 50}
  validates :phone_number, numericality: true, allow_blank: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
