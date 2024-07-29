module Orders
  class PurchaseOrderLineItem < ApplicationRecord
    belongs_to :purchase_orders
  end
end
