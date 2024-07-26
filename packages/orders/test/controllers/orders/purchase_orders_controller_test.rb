require "test_helper"

module Orders
  class PurchaseOrdersControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @purchase_order = orders_purchase_orders(:one)
    end

    test "should get index" do
      get purchase_orders_url
      assert_response :success
    end

    test "should get new" do
      get new_purchase_order_url
      assert_response :success
    end

    test "should create purchase_order" do
      assert_difference("PurchaseOrder.count") do
        post purchase_orders_url, params: { purchase_order: { business_unit: @purchase_order.business_unit, estimated_lpn: @purchase_order.estimated_lpn, external_order_id: @purchase_order.external_order_id, order_date: @purchase_order.order_date, order_number: @purchase_order.order_number, receipt_date: @purchase_order.receipt_date, status: @purchase_order.status, type: @purchase_order.type } }
      end

      assert_redirected_to purchase_order_url(PurchaseOrder.last)
    end

    test "should show purchase_order" do
      get purchase_order_url(@purchase_order)
      assert_response :success
    end

    test "should get edit" do
      get edit_purchase_order_url(@purchase_order)
      assert_response :success
    end

    test "should update purchase_order" do
      patch purchase_order_url(@purchase_order), params: { purchase_order: { business_unit: @purchase_order.business_unit, estimated_lpn: @purchase_order.estimated_lpn, external_order_id: @purchase_order.external_order_id, order_date: @purchase_order.order_date, order_number: @purchase_order.order_number, receipt_date: @purchase_order.receipt_date, status: @purchase_order.status, type: @purchase_order.type } }
      assert_redirected_to purchase_order_url(@purchase_order)
    end

    test "should destroy purchase_order" do
      assert_difference("PurchaseOrder.count", -1) do
        delete purchase_order_url(@purchase_order)
      end

      assert_redirected_to purchase_orders_url
    end
  end
end
