class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :ensure_user_logged_in, except: :index

  def new
    current_user
    render "users/new"
  end

  def index
    unless @current_user.role == "owner"
      redirect_to "/"
    else
      render "index"
    end
  end

  def create
    ownerassignedrole = params[:role]
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: ownerassignedrole.present? ? ownerassignedrole : "customer",
    )

    if new_user.save
      unless ownerassignedrole.present?
        session[:current_user_id] = new_user.id
      else
        flash[:success] = "New  #{params[:role]}, #{params[:first_name]} Created"
      end
      redirect_to "/"
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
