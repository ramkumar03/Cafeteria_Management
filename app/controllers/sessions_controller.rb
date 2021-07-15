class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      render plain: user.first_name
    else
      render plain: "Incorrect login"
    end
  end
end
