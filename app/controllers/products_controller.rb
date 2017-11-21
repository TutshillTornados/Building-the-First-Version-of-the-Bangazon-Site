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

      def product_params
        params.require(:product).permit(:search, :product_name, :product_price, :product_desc, :quantity, :local_delivery, :active, :product_type_id)
      end

end
