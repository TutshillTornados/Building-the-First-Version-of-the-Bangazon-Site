class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        # session[:customer_id] = @customer.id
        # redirect_to edit_customer_path(@customer.id), notice: 'Thank you for signing up!'
        
    else
        render :new
    end
  end

  private
    def product_params
      params.require(:product).permit(:product_name, :product_price, :product_desc, :quantity)
    end
end
