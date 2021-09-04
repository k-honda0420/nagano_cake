class Public::OrdersController < ApplicationController
  def new
    @order = Order.all

  end

  def complete
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
    @order = Order.customer

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

    redirect_to orders_complete_path
  end


     private
  def order_params
    params.require(:order).permit(:customer_id, :total_payment, :postal_code, :address, :name, :shipping_cost)
  end

end


