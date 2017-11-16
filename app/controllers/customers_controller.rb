class CustomersController < ApplicationController
    def new
        @customer = Customer.new
    end
    
    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            session[:customer_id] = @customer.id
            redirect_to edit_customer_path(@customer.id), notice: 'Thank you for signing up!'
        else
            render :new
        end
    end
    
    def index
        @customers = Customer.all
    end

    def show
        @customer = Customer.find(params[:id])
    end
    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_info_params)
            redirect_to customers_path
            # flash.now.alert = 'You did it kid'
        else
            render 'edit'
            # flash.now.alert = 'You did not do it kid'
        end
    end

      private
    
      def customer_params
        params.require(:customer).permit(:email, :password, :password_confirmation)
      end
      def customer_info_params
        params.require(:customer).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :phone_number)
      end

      
end
