class Public::OrdersController < ApplicationController
  def new
    @order = Order.all

  end

  def complete
    @cart_items = current_customer.cart_items

    @cart_items.destroy_all
  end

  def index
    @order = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all

  end

  def comfirm
    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method].to_i
    @address = current_customer.addresses.find(params[:order][:address])
    @order.address = @address.address
    @order.postal_code = @address.postal_code
    @order.name = @address.name
    @cart_items = current_customer.cart_items

  end

  def create
   # @order = Order.new
   #@order.customer_id = current_customer.id
   #@order.save

    #redirect_to orders_complete_path


    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.payment_method = params[:order][:payment_method].to_i
#    @order.address = Order.find(params[:address])
#    @order.payment_method = Order.find(params[:payment_method])
#    @order.total_payment = Order.find(params[:total_payment])
    @order.save
#    @order_detail.item_id = CartItems.item_id
#    @order_detail.price = CartItems.price
#    @order_detail.amount = CartItems.amount
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    redirect_to orders_complete_path
  end


     private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :postal_code, :address, :name, :shipping_cost)
  end

end


