class MenuCategory < ActiveRecord::Base
  def to_pleasant_string
    "#{id}. #{name} | Available: #{status}"
  end
end
