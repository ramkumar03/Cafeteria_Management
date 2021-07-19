class OrdersController < ApplicationController
  def index
    @orders = @current_user.role != "customer" ? Order.all : @current_user.orders
    render "index"
  end

  def create
    if @current_user.role != "customer"
      ordertype = false #walkin
    else
      ordertype = true #online
    end

    new_order = Order.new(
      user_id: @current_user.id,
      ordered_at: DateTime.now,
      total_amount: params[:total_amount],
      deliver_address: params[:deliver_address],
      online_order: ordertype,
    )

    if new_order.save
      flash[:success] = "Order Placed"
      redirect_to create_order_item_path(id: new_order.id)
    else
      flash[:error] = new_order.errors.full_messages.join(", ")
      redirect_to "/"
    end
  end

  def update
    order = Order.find(params[:id])
    order.delivered_at = DateTime.now
    order.save!

    redirect_to orders_path
  end
end
