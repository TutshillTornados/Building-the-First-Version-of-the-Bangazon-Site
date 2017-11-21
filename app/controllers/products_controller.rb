class ProductsController < ApplicationController

  #Creates new instance of class Product
  def new
    @product = Product.new
    @photo = Photo.new
    @product_type = ProductType.all
  end

  #Creates a product to save to database based on params in private, adding the user_id, time it was added, and an active status, it adds an image then redirects user to product view.
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
        redirect_to product_path(@product)
    else
        render 'edit'
    end
  end

  #sets active column in product table to 0, making it unviewable to the user, redirects to the myproduct view. 
  def destroy
    @product = Product.find(params[:id])
    @product.active = 0
    if @product.save
      redirect_to myproducts_url
    else 
      redirect_to myproducts_url
    end
  end

  #shows specific product based on the id
  def show
      @product = Product.find(params[:id])
  end

  #shows the users products in view based on matching customer_id and user_id and if the product is active.
  def showSellerProduct
      @products = Product.where(:customer_id => session[:user_id], active: true)
      render 'sellerproducts'
  end

  #Creates the search option that fires on the product parameters. 
  def index 
    if params[:product]
    @products = Product.where("product_name like ? AND active = true", "%#{params[:product]}%")
  else 
    @products = Product.all
  end

  def add_to_cart
    @order = Order.find_or_create_by(customer_id: session[:user_id], pay_method_id: nil)
    @orderline = OrderLine.new(purchase_params)
    @orderline.order_id = @order.id
    @orderline.save
    puts @orderline.errors.full_messages
  end
  
  #Allows user to search based on categories.
  def categories
    @categories = ProductType.all
    @product_names = Product.all
    @product_info = Product.group(:product_type_id).count
    puts @product_info
  end
  
  # params for posting to database.
  private
    def image_params
      params.require(:product).permit(:image_file)
    end
    
    def purchase_params
      params.permit(:product_id)
    end

    def product_params
      params.require(:product).permit(:search, :product_name, :product_price, :product_desc, :quantity, :local_delivery, :active, :product_type_id)
    end

end
