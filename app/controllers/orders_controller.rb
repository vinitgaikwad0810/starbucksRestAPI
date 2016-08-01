class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  before_action :authenticate

  

swagger_controller :order, "Order"

  # swagger_api :index do
  #   summary "Fetches all Book items"
  #   notes "This lists all books"
  #   param :query, :page, :integer, :optional, "Page number"
  #   response :ok, "Success", :Order
  #   response :unauthorized
  #   response :not_acceptable, "The request you made is not acceptable"
  #   response :requested_range_not_satisfiable
  # end
  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end


swagger_api :show do
    summary "Fetches a single User item"
    param :path, :id, :integer, :optional, "User Id"
    response :ok, "Success", :Order
    response :unauthorized
    response :not_acceptable
    response :not_found
  end
  # GET /orders/1
  def show
    Rails.logger.debug("debug::" + params["id"])
    
    @order = Order.joins(:items).where('items.order_id' => params["id"]).distinct
    render json: @order
  end

# swagger_api :create do
#     summary "Creates a new Book"
#     param :form, :title, :string, :required, "Title"
#     param :form, :description, :string, :required, "Description"
#     param :form, :page_count, :integer, :required, "Page count"
#     response :created, "Success", :Book
#     response :unauthorized
#     response :not_acceptable
#   end
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

# swagger_api :update do
#     summary "Creates a new Book"
#     param :path, :id, :integer, :required, "Book Id"
#     param :form, :title, :string, :required, "Title"
#     param :form, :description, :string, :required, "Description"
#     param :form, :page_count, :integer, :required, "Page count"
#     response :created, "Success", :Book
#     response :unauthorized
#     response :not_acceptable
#   end
  # PATCH/PUT /orders/1
  def update
    #@order.update(order_params)
    # order = Order.joins(:items).where('items.order_id' => params["id"]).distinct
    # order.update(params["id"],order_params)
    # Rails.logger.debug("debug::" + order.inspect)
    # @order = Order.joins(:items).where('items.order_id' => params["id"]).distinct

    # if @order.update(order_params)
    #   render json: @order
    # else
    #   render json: @order.errors, status: :unprocessable_entity
      # end
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

# swagger_api :destroy do
#     summary "Deletes an existing Book item"
#     param :path, :id, :integer, :optional, "Book Id"
#     response :unauthorized
#     response :not_found
#   end
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
