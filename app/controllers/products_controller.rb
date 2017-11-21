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
    # @product.active = 1 
    # @product.product_type_id = @product_type
    if @product.save
      redirect_to product_path(@product)
    else
      @product_type = ProductType.all
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.active = 0
    if @product.save
      redirect_to 'sellerproduct'
    else 
      redirect_to 'sellerproduct'
    end
  end

  def show
      @product = Product.find(params[:id]) 
  end

  def showSellerProduct
      @products = Product.where(:customer_id => session[:user_id], active: true)
      render 'sellerproducts'
  end

  # def index
  #   @products = Product.where(active: true)
  # end

  def index
    @products = Product.all
  end

def categories
    @categories = ProductType.all
    @product_info = Product.all
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
  
    def product_params
      params.require(:product).permit(:search, :product_name, :product_price, :product_desc, :quantity, :local_delivery, :active, :product_type_id)
    end
    
    def image_params
      params.require(:product).permit(:image_file)
    end
end
