class OrdersController < ApplicationController
  def index
    @orders = @current_user.orders
    render "index"
  end

  def create
    order = Order.create!(
      user_id: @current_user.id,
      ordered_at: DateTime.now,
      total_amount: params[:total_amount],
    )

    redirect_to create_order_item_path(id: order.id)
  end
end
