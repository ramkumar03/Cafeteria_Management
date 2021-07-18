class MenuCategoriesController < ApplicationController
  def index
    @cart_items = @current_user.cart_items
    render "index"
  end

  def create
    category = MenuCategory.find_by(id: params[:category])
    unless category.present?
      new_category = MenuCategory.new(
        name: params[:newcategory],
        status: true,
      )
      unless new_category.save
        flash[:error] = "No category selected or created"
        redirect_to new_menu_item_path
      else
        if params[:name].present? && params[:price].present? && params[:description].present?
          redirect_to create_menu_item_path(
            menu_category_id: new_category.id,
            name: params[:name],
            price: params[:price],
            description: params[:description],
          )
        else
          flash[:success] = "New #{params[:newcategory]} Category created"
          redirect_to new_menu_item_path
        end
      end
    else
      MenuCategory.find(category.id).update(name: params[:newcategory])

      if params[:name].present? && params[:price].present? && params[:description].present?
        redirect_to create_menu_item_path(
          menu_category_id: category.id,
          name: params[:name],
          price: params[:price],
          description: params[:description],
        )
      else
        flash[:success] = "#{params[:newcategory]} Category Updated .\n Enter item details to add menu"
        redirect_to new_menu_item_path
      end
    end
  end

  def update
    menucategory = MenuCategory.find(params[:id])
    menucategory.status = !menucategory.status
    menucategory.save!
    redirect_to menu_categories_path
  end
end
