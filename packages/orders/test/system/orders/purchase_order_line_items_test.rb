require "application_system_test_case"

module Orders
  class PurchaseOrderLineItemsTest < ApplicationSystemTestCase
    setup do
      @purchase_order_line_item = orders_purchase_order_line_items(:one)
    end

    test "visiting the index" do
      visit purchase_order_line_items_url
      assert_selector "h1", text: "Purchase order line items"
    end

    test "should create purchase order line item" do
      visit purchase_order_line_items_url
      click_on "New purchase order line item"

      fill_in "Line number", with: @purchase_order_line_item.line_number
      fill_in "Ordered qty", with: @purchase_order_line_item.ordered_qty
      fill_in "Purchase orders", with: @purchase_order_line_item.purchase_orders_id
      fill_in "Received qty", with: @purchase_order_line_item.received_qty
      fill_in "Sku code", with: @purchase_order_line_item.sku_code
      fill_in "Sku description", with: @purchase_order_line_item.sku_description
      fill_in "Sku holdcode", with: @purchase_order_line_item.sku_holdcode
      fill_in "Sku type", with: @purchase_order_line_item.sku_type
      fill_in "Uom", with: @purchase_order_line_item.uom
      click_on "Create Purchase order line item"

      assert_text "Purchase order line item was successfully created"
      click_on "Back"
    end

    test "should update Purchase order line item" do
      visit purchase_order_line_item_url(@purchase_order_line_item)
      click_on "Edit this purchase order line item", match: :first

      fill_in "Line number", with: @purchase_order_line_item.line_number
      fill_in "Ordered qty", with: @purchase_order_line_item.ordered_qty
      fill_in "Purchase orders", with: @purchase_order_line_item.purchase_orders_id
      fill_in "Received qty", with: @purchase_order_line_item.received_qty
      fill_in "Sku code", with: @purchase_order_line_item.sku_code
      fill_in "Sku description", with: @purchase_order_line_item.sku_description
      fill_in "Sku holdcode", with: @purchase_order_line_item.sku_holdcode
      fill_in "Sku type", with: @purchase_order_line_item.sku_type
      fill_in "Uom", with: @purchase_order_line_item.uom
      click_on "Update Purchase order line item"

      assert_text "Purchase order line item was successfully updated"
      click_on "Back"
    end

    test "should destroy Purchase order line item" do
      visit purchase_order_line_item_url(@purchase_order_line_item)
      click_on "Destroy this purchase order line item", match: :first

      assert_text "Purchase order line item was successfully destroyed"
    end
  end
end
