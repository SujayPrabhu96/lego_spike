class Warehouse < ApplicationRecord
  has_many :orders_purchase_order_warehouses
  has_many :purchase_orders, through: :orders_purchase_order_warehouses
end
