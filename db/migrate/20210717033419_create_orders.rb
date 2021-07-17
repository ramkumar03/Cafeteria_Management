class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.datetime :ordered_at
      t.datetime :delivered_at
      t.decimal :total_amount

      t.timestamps
    end
  end
end
