class Public::CustomersController < ApplicationController
    def show
      @customer = current_customer
    end
    def unsubscribe
      @customer = current_customer

    end

    def withdraw
         @customer = current_customer
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @customer.update(is_active: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end

    def edit
      @customer = current_customer

    end

    def update
      @customer = current_customer

      if @customer.update(customer_params)
        flash[:notice]="Customer was successfully updated."
        redirect_to customers_my_page_path
      else
        render :edit
      end
    end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end

end