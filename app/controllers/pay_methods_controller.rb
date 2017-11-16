class PayMethodsController < ApplicationController
    def new
        @pay_method = PayMethod.new
    end

    def index
        @pay_methods = PayMethod.all
    end

    def create
        @pay_method = PayMethod.new(pay_method_params)
        if @pay_method.save
            redirect_to @pay_method
        else
            render 'new'
        end
    end

    def destroy
        @pay_method = PayMethod.find(params[:id])
        @pay_method.destroy

        redirect_to pay_method_path
    end

    def pay_method_params
        params.require(:pay_method).permit(:payment_type, :account_number, :expiration_date)
    end
end
