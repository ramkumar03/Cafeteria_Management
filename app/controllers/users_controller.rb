class UsersController < ApplicationController
  def index
    user = User.all.map { |user| user.to_userlist }.join("\n")
    render plain: user
  end
end
