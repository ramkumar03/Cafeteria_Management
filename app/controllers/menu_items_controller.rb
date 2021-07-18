class MenuItemsController < ApplicationController
  before_action :ensure_current_is_owner

  def new
  end

  def create
    new_item = MenuItem.new(
      menu_category_id: params[:menu_category_id],
      name: params[:name],
      description: params[:description],
      price: params[:price],
      availability: true,
    )

    if new_item.save
      redirect_to menu_categories_path
    else
      flash[:error] = new_item.errors.full_messages.join(", ")
      redirect_to new_menu_item_path
    end
  end

  def update
    menuitem = MenuItem.find(params[:id])
    menuitem.availability = !menuitem.availability
    menuitem.save!
    redirect_to menu_categories_path
  end

  def destroy
    MenuItem.find(params[:id]).destroy
    redirect_to menu_categories_path
  end
end
