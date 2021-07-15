class MenuCategory < ActiveRecord::Base
<<<<<<< HEAD
  has_many :menu_items

=======
>>>>>>> 1c33e934be8f5368a240a0038933637eb5146548
  def to_category
    "#{id}. #{name} | Available: #{status}"
  end
end
