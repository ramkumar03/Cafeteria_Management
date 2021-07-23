class OrdersController < ApplicationController
  def index
    @orders = @current_user.role != "customer" ? Order.all : @current_user.orders
    render "index"
  end

  def create
    if @current_user.role == "clerk"
      ordertype = false #walkin
      new_order = Order.new(
        user_id: @current_user.id,
        ordered_at: DateTime.now,
        delivered_at: DateTime.now,
        total_amount: params[:total_amount],
        online_order: ordertype,
      )

      new_order.save
      flash[:success] = "walk-in Order Placed"
      redirect_to create_order_item_path(id: new_order.id)
    else
      ordertype = true #online
      unless params[:deliver_address] == ""
        new_order = Order.new(
          user_id: @current_user.id,
          ordered_at: DateTime.now,
          total_amount: params[:total_amount],
          deliver_address: params[:deliver_address],
          online_order: ordertype,
        )

        new_order.save
        flash[:success] = "Order Placed"
        redirect_to create_order_item_path(id: new_order.id)
      else
        flash[:error] = "Delivery address can't be empty"
        redirect_to "/"
      end
    end
  end

  def update
    order = Order.find(params[:id])
    order.delivered_at = DateTime.now
    order.save!

    redirect_to orders_path
  end
end
