class MenuItem < ActiveRecord::Base
  belongs_to :menu_category

  def to_menu
    " #{name} | Price: #{price} "
  end
end
