class ProductsController < ApplicationController

  def new
    # session[:customer_id] ???
    @product = Product.new
    @image = Image.new
    @product_type = ProductType.all
  end

  def create
    @product = Product.new(product_params)
    @product.customer_id = session[:user_id]
    @product.product_added = DateTime.now()   
    if @product.save
      # redirect_to product_path, notice: 'U DID IT KID'
    else
      render :new
    end
  end

  def show
    @product= Product.find(params[:id])
  end

 # THIS WILL BE THE FINAL METHODS
  # def create
  #   @image = Image.new(image_params)
  #   if @image.save
  #     # :image_id = @image.id
  #     createProduct(@image.id)
  #   else
  #     render :new
  #   end
  # end

  # def createProduct(imageID)
  #   @product = Product.new(product_params)
  #   @product.customer_id = session[:user_id]
  #   @product.image_id = imageID
  #   # binding.pry
  #     if @product.save
  #       # redirect_to product_path, notice: 'U DID IT KID'
  #     else
  #       render :new
  #     end
  # end
  # ^^ FINAL METHODS

  private
    def product_params
      # add :product_type to permit()
      params.require(:product).permit(:product_name, :product_price, :product_desc, :quantity, :local_delivery)
    end

    def image_params
      params.require(:product).permit(:image_file)
    end
end
