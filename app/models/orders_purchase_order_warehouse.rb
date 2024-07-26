class OrdersPurchaseOrderWarehouse < ApplicationRecord
  belongs_to :warehouse
  belongs_to :purchase_order, class_name: 'Orders::PurchaseOrder'
end
