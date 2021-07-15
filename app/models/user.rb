class User < ActiveRecord::Base
  def to_userlist
    "Name: #{first_name} #{last_name} | Role: #{role} "
  end
end
