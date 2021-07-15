class MenuItem < ActiveRecord::Base
  def to_menu
    " #{name} | Price: #{price} "
  end
end
