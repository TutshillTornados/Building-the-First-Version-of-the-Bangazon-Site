class PayMethodsController < ApplicationController
    
    #Creates new instance of class pay_method
    def new
        @pay_method = PayMethod.new
    end

    #shows pay_methods on pay_method index view where customer_id matches the current user_id.
    def index
        @pay_methods = PayMethod.where(:customer_id => session[:user_id], active_record: true)
    end

    #Creates pay_method to save to database based on params in private, then redirects user to show pay_methods view.
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

    #sets active_record column in pay_method table to 0, making it unviewable to the user. 
    def destroy
        @pay_method = PayMethod.find(params[:id])
        @pay_method.active_record = 0
        if @pay_method.save
            redirect_to pay_methods_path
        else
            redirect_to pay_methods_path
        end
    end

    private 
    #private params for posting to database.
    def pay_method_params
        params.require(:pay_method).permit(:payment_type, :account_number, :expiration_date, :active_record)
    end
end
