class ProductsController < ApplicationController

  def new
    @product = Product.new
    @photo = Photo.new
    @product_type = ProductType.all

  end


  def create
    @product = Product.new(product_params)
    @product.customer_id = session[:user_id]
    @product.product_added = DateTime.now()
    @product.active = 1 
    if @product.save
      if params[:images]
        params[:images].each { |image|
        @product.photos.create(image: image)
      }
      end
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
      redirect_to myproducts_url
    else 
      redirect_to myproducts_url
    end
  end

  def show
      @product = Product.find(params[:id]) 
  end

  def showSellerProduct
      @products = Product.where(:customer_id => session[:user_id], active: true)
      render 'sellerproducts'
  end

  def add_to_cart
    @order = Order.find_or_create_by(customer_id: session[:user_id], pay_method_id: nil)
    @orderline = OrderLine.new(purchase_params)
    @orderline.order_id = @order.id
    puts @order.errors.full_messages
  end
  
  # def index
  #   @products = Product.where(active: true)
  # end

  def index
    @products = if params[:product]
      Product.where("product_name like ?", "%#{params[:product]}%")
    else 
      @products = Product.all
    end
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

  private
    # def product_params
    #   params.require(:product).permit(:product_name, :product_price, :product_desc, :quantity, :local_delivery, :product_type_id)
    # end
    def image_params
      params.require(:product).permit(:image_file)
    end

    def purchase_params
      params.require(:product).permit(:product_id)
    end
    def product_params
      params.require(:product).permit(:search, :product_name, :product_price, :product_desc, :quantity, :local_delivery, :active, :product_type_id)
    end
      # def image_params
      #   params.require(:image).permit([:image_file_name, :image_file_size, :image_content_type, :image_updated_at])
      # end
end
