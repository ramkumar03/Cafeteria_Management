class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  validates :deliver_address, presence: true
end
