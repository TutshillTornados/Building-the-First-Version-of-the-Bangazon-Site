class ProductsController < ApplicationController

    def new
        @product = Product.new
    end

    def create
        @product = Product.create( product_params )
      end
      
      private
      
      # Use strong_parameters for attribute whitelisting
      # Be sure to update your create() and update() controller methods.
      
      def product_params
        params.require(:customer).permit(:product)
      end
end
