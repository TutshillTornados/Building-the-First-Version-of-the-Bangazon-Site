class PayMethodsController < ApplicationController
    def new
        @pay_method = PayMethod.new
    end

    def index
        @pay_methods = PayMethod.where(:customer_id => session[:user_id], active_record: true)
    end

    def create
        @pay_method = PayMethod.new(pay_method_params)
        @pay_method.customer_id = session[:user_id]
        @pay_method.active_record = 1
        if @pay_method.save
            redirect_to pay_methods_path
        else
            render 'new'
        end
    end

    def show
        @pay_method = PayMethod.find(params[:id])
    end

    def destroy
        @pay_method = PayMethod.find(params[:id])
        @pay_method.active_record = 0
        if @pay_method.save
            redirect_to pay_methods_path
        else
            redirect_to pay_methods_path
        end
    end


    def pay_method_params
        params.require(:pay_method).permit(:payment_type, :account_number, :expiration_date, :active_record)
    end
end
