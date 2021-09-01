class Public::OrdersController < ApplicationController
  def new
    @order = Order.all

  end

  def complete
  end

  def index
  end

  def show
  end

  def comfirm
    @order = current_customer.orders.new
    @address = current_customer.addresses.find(params[:order][:address])
    @order.address = @address.address
    @order.postal_code = @address.postal_code
    @order.name = @address.name
    @cart_items = current_customer.cart_items
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_complete_path

  end

    private
  def address_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method)
  end
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method)
  end

end
