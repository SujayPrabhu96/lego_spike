require "test_helper"

module Orders
  class PurchaseOrderLineItemsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @purchase_order_line_item = orders_purchase_order_line_items(:one)
    end

    test "should get index" do
      get purchase_order_line_items_url
      assert_response :success
    end

    test "should get new" do
      get new_purchase_order_line_item_url
      assert_response :success
    end

    test "should create purchase_order_line_item" do
      assert_difference("PurchaseOrderLineItem.count") do
        post purchase_order_line_items_url, params: { purchase_order_line_item: { line_number: @purchase_order_line_item.line_number, ordered_qty: @purchase_order_line_item.ordered_qty, purchase_orders_id: @purchase_order_line_item.purchase_orders_id, received_qty: @purchase_order_line_item.received_qty, sku_code: @purchase_order_line_item.sku_code, sku_description: @purchase_order_line_item.sku_description, sku_holdcode: @purchase_order_line_item.sku_holdcode, sku_type: @purchase_order_line_item.sku_type, uom: @purchase_order_line_item.uom } }
      end

      assert_redirected_to purchase_order_line_item_url(PurchaseOrderLineItem.last)
    end

    test "should show purchase_order_line_item" do
      get purchase_order_line_item_url(@purchase_order_line_item)
      assert_response :success
    end

    test "should get edit" do
      get edit_purchase_order_line_item_url(@purchase_order_line_item)
      assert_response :success
    end

    test "should update purchase_order_line_item" do
      patch purchase_order_line_item_url(@purchase_order_line_item), params: { purchase_order_line_item: { line_number: @purchase_order_line_item.line_number, ordered_qty: @purchase_order_line_item.ordered_qty, purchase_orders_id: @purchase_order_line_item.purchase_orders_id, received_qty: @purchase_order_line_item.received_qty, sku_code: @purchase_order_line_item.sku_code, sku_description: @purchase_order_line_item.sku_description, sku_holdcode: @purchase_order_line_item.sku_holdcode, sku_type: @purchase_order_line_item.sku_type, uom: @purchase_order_line_item.uom } }
      assert_redirected_to purchase_order_line_item_url(@purchase_order_line_item)
    end

    test "should destroy purchase_order_line_item" do
      assert_difference("PurchaseOrderLineItem.count", -1) do
        delete purchase_order_line_item_url(@purchase_order_line_item)
      end

      assert_redirected_to purchase_order_line_items_url
    end
  end
end
