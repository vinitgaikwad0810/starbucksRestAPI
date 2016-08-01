class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  before_action :authenticate

  




  def index
    @orders = Order.all

    render json: @orders
  end


  
  def show
    Rails.logger.debug("debug::" + params["id"])
    
    @order = Order.joins(:items).where('items.order_id' => params["id"]).distinct
    render json: @order
  end


  # POST /orders
  def create
    Rails.logger.debug("debug::" + order_params.inspect)
    @order = Order.new(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update

    @order = Order.find(params[:id])
    Rails.logger.debug("debug::" + @order.inspect)
    @order.update_attributes(order_params)
    if @order.save
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
    #render json: @order
  end


  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit( :location, :status, items_attributes:  [ :id, :name, :quantity, :milk, :size, :order_id,:_destroy])
    end


end
