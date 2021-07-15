class MenuCategory < ActiveRecord::Base
  has_many :menu_items

  def to_category
    "#{id}. #{name} | Available: #{status}"
  end
end
