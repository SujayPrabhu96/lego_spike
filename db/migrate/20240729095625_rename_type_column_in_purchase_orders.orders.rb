# This migration comes from orders (originally 20240729095452)
class RenameTypeColumnInPurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    rename_column :orders_purchase_orders, :type, :order_type
  end
end
