class MenuItem < ActiveRecord::Base
  belongs_to :menu_category
  has_many :order_items

  def self.get_menu_items(id)
    where(menu_category_id: id)
  end
end
