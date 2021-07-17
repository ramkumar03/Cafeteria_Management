class MenuCategoriesController < ApplicationController
  def index
    @cart_items = @current_user.cart_items
    render "index"
  end

  def create
    category = MenuCategory.find_by(name: params[:category])
    unless category.present?
      category = MenuCategory.create!(
        name: params[:category],
        status: true,
      )
    end

    redirect_to create_menu_item_path(
      menu_category_id: category.id,
      name: params[:name],
      price: params[:price],
      description: params[:description],
    )
  end
end
