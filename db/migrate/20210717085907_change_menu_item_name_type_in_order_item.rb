class ChangeMenuItemNameTypeInOrderItem < ActiveRecord::Migration[6.1]
  def change
    change_column :order_items, :menu_item_name, :string
  end
end
