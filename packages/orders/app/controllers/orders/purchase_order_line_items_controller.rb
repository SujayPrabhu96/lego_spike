module Orders
  class PurchaseOrderLineItemsController < ApplicationController
    before_action :set_purchase_order_line_item, only: %i[ show edit update destroy ]

    # GET /purchase_order_line_items
    def index
      @purchase_order_line_items = PurchaseOrderLineItem.all
    end

    # GET /purchase_order_line_items/1
    def show
    end

    # GET /purchase_order_line_items/new
    def new
      @purchase_order_line_item = PurchaseOrderLineItem.new
    end

    # GET /purchase_order_line_items/1/edit
    def edit
    end

    # POST /purchase_order_line_items
    def create
      @purchase_order_line_item = PurchaseOrderLineItem.new(purchase_order_line_item_params)

      if @purchase_order_line_item.save
        redirect_to @purchase_order_line_item, notice: "Purchase order line item was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /purchase_order_line_items/1
    def update
      if @purchase_order_line_item.update(purchase_order_line_item_params)
        redirect_to @purchase_order_line_item, notice: "Purchase order line item was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /purchase_order_line_items/1
    def destroy
      @purchase_order_line_item.destroy!
      redirect_to purchase_order_line_items_url, notice: "Purchase order line item was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_purchase_order_line_item
        @purchase_order_line_item = PurchaseOrderLineItem.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def purchase_order_line_item_params
        params.require(:purchase_order_line_item).permit(:line_number, :sku_code, :sku_description, :uom, :ordered_qty, :received_qty, :sku_holdcode, :sku_type, :purchase_orders_id)
      end
  end
end
