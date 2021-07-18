class MenuCategory < ActiveRecord::Base
  has_many :menu_items

  validates :name,
            presence: true,
            length: { minimum: 4 },
            uniqueness: { case_sensitive: false }

  def to_category
    "#{id}. #{name} | Available: #{status}"
  end
end
