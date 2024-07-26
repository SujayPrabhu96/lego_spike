class CreateOrdersPurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders_purchase_orders do |t|
      t.string :order_number
      t.string :external_order_id
      t.string :type
      t.string :status
      t.string :business_unit
      t.date :order_date
      t.date :receipt_date
      t.integer :estimated_lpn

      t.timestamps
    end
  end
end
