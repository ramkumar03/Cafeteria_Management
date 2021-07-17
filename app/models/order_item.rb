class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :menu_item

  def total_amount
    Order.find(order_id).total_amount
  end
end
