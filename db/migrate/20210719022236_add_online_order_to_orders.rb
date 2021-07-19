class AddOnlineOrderToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :online_order, :boolean
  end
end
