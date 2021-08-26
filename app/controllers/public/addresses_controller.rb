class Public::AddressesController < ApplicationController
  def index
    @address = Address.all
    @customer = current_customer
  end

  def edit
  end
  
 private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address)
  end

end
