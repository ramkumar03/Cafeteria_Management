class MenuCategory < ActiveRecord::Base
  def to_category
    "#{id}. #{name} | Available: #{status}"
  end
end
