class MenuItem < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :menu_category

=======
>>>>>>> 1c33e934be8f5368a240a0038933637eb5146548
  def to_menu
    " #{name} | Price: #{price} "
  end
end
