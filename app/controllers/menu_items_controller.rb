class MenuItemsController < ApplicationController
  def create
    def new
    end

    MenuItem.create!(
      menu_category_id: params[:menu_category_id],
      name: params[:name],
      description: params[:description],
      price: params[:price],
      availability: true,
    )

    redirect_to menu_categories_path
  end
end
