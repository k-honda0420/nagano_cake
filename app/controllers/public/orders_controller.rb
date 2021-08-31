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

    private
  def address_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :payment_method)
  end


end
