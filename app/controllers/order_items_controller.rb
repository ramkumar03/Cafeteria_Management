class OrderItemsController < ApplicationController
  def index
    if Order.where(id: params[:id]).present?
      order = Order.find(params[:id])
      if order.user_id == @current_user.id
        @order_items = order.order_items
        render "index"
      else
        redirect_to orders_path
      end
    else
      redirect_to orders_path
    end
  end

  def create
    @current_user.cart_items.each do |cartitem|
      OrderItem.create!(
        order_id: Order.last.id,
        menu_item_id: cartitem.menu_item_id,
        menu_item_name: MenuItem.find(cartitem.menu_item_id).name,
        menu_item_price: MenuItem.find(cartitem.menu_item_id).price,
        quantity: cartitem.quantity,
      )
    end
    current_user.cart_items.destroy_all

    redirect_to orders_path
  end
end
