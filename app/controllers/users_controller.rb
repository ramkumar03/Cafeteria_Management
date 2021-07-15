class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    render "users/new"
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: "customer",
    )

    redirect_to "/menu_categories"
  end
end
