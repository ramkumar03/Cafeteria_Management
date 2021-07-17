class User < ActiveRecord::Base
  validates :first_name, presence: true, length: { minimum: 3 }
  validates :email, uniqueness: { case_sensitive: false }

  has_secure_password
  has_many :cart_items
  has_many :orders
end
