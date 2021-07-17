class CartItemsController < ApplicationController
  def create
    menu_item_id = params[:menu_item_id]
    items = @current_user.cart_items
    if CartItem.find_by(user_id: @current_user.id, menu_item_id: menu_item_id).present?
      redirect_to menu_categories_path
    else
      CartItem.create!(
        user_id: current_user.id,
        menu_item_id: menu_item_id,
        quantity: 1,
      )
      redirect_to menu_categories_path
    end
  end

  def update
    item = CartItem.find(params[:id])
    quantity = params[:quantity].to_i

    if item.quantity == 1 and quantity == -1
      CartItem.destroy(params[:id])
    else
      item.quantity += quantity
      item.save!
    end

    redirect_to menu_categories_path
  end

  def destroy
    @current_user.cart_items.destroy_all
    redirect_to menu_categories_path
  end
end
