class Public::CustomersController < ApplicationController
    def show
      @customer = current_customer
    end
    def unsubscribe
      @customer = current_customer
    end

    def unsubscribe
      @customer = current_customer
    end

    def withdraw
        redirect_to root_path
    end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end