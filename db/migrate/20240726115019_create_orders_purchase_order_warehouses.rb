class CreateOrdersPurchaseOrderWarehouses < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_purchase_order_warehouses do |t|
      t.references :warehouse, null: false, foreign_key: true
      t.references :purchase_order, null: false, foreign_key: { to_table: :orders_purchase_orders }

      t.timestamps
    end
  end
end
