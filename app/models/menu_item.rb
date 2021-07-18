class MenuItem < ActiveRecord::Base
  belongs_to :menu_category
  has_many :order_items

  validates :name,
            presence: true,
            length: { minimum: 4 },
            uniqueness: { case_sensitive: false }
  validates :price, presence: true
  validates :description, presence: true

  def self.get_menu_items(id)
    where(menu_category_id: id)
  end
end
