Orders::PurchaseOrder.class_eval do
  has_many :orders_purchase_order_warehouses, class_name: 'OrdersPurchaseOrderWarehouse'
  has_many :warehouses, through: :orders_purchase_order_warehouses
end