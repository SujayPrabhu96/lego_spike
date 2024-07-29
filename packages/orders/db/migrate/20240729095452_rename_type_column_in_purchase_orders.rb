class RenameTypeColumnInPurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders_purchase_orders, :type, :order_type
  end
end
