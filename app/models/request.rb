class Request < ActiveRecord::Base
  belongs_to :user

  validates :title_name, presence: true, length:{maximum: 50}
  validates :content, presence: true, length:{maximum: 300}
end
