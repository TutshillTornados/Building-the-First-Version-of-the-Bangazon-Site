class CustomersController < ApplicationController
    
    #Creates new instance of class Customer
    def new
        @customer = Customer.new
    end

    #Creates customer to save to database based on params in private, then redirects user to edit info.
    def create
        @customer = Customer.new(customer_params)
        if @customer.save
            session[:user_id] = @customer.id
            redirect_to edit_customer_path(@customer.id), notice: 'Thank you for signing up!'
        else
            render :new
        end
    end

   #Index route to show all customers after sign up
    def index
        @customers = Customer.all
    end
    #
    def show
        @customer = Customer.find(params[:id])
    end
    #allows user to edit customer details based on user_id
    def edit
        @customer = Customer.find(params[:id])
    end

    #updates customer based on id and redirects to home.
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_info_params)
            redirect_to products_path        
        else
            render 'edit'
        end
    end

      private
    #private params for posting to database.
      def customer_params
        params.require(:customer).permit(:email, :password, :password_confirmation)
      end

      def customer_info_params
        params.require(:customer).permit(:first_name, :last_name, :street_address, :city, :state, :zip, :phone_number)
      end

      
end
