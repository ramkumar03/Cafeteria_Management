class AddDeliverAddressToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :deliver_address, :string
  end
end
