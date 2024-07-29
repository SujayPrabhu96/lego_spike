module Orders
  class PurchaseOrdersController < ApplicationController
    before_action :set_purchase_order, only: %i[ show edit update destroy ]

    # GET /purchase_orders
    def index
      @purchase_orders = PurchaseOrder.all
    end

    # GET /purchase_orders/1
    def show
    end

    # GET /purchase_orders/new
    def new
      @purchase_order = PurchaseOrder.new
    end

    # GET /purchase_orders/1/edit
    def edit
    end

    # POST /purchase_orders
    def create
      @purchase_order = PurchaseOrder.new(purchase_order_params)

      if @purchase_order.save
        redirect_to @purchase_order, notice: "Purchase order was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /purchase_orders/1
    def update
      if @purchase_order.update(purchase_order_params)
        redirect_to @purchase_order, notice: "Purchase order was successfully updated.", status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /purchase_orders/1
    def destroy
      @purchase_order.destroy!
      redirect_to purchase_orders_url, notice: "Purchase order was successfully destroyed.", status: :see_other
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_purchase_order
        @purchase_order = PurchaseOrder.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def purchase_order_params
        params.require(:purchase_order).permit(:order_number, :external_order_id, :order_type, :status, :business_unit, :order_date, :receipt_date, :estimated_lpn)
      end
  end
end
