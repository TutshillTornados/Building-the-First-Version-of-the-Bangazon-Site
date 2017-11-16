class ProductsController < ApplicationController

  def new
    # session[:customer_id] ???

    @product = Product.new()
    @product_type = ProductType.all
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      createProduct(@image.id)
    else
      render :new
    end
  end

  def createProduct(imageId)
  
      @product = Product.new(product_params(imageId))
      if @product.save
        # redirect_to product_path, notice: 'U DID IT KID'
   
      else
        render :new
      end
    else
      render :new
    end

  end
  
  private
    def product_params(image_id)
      :image_id = image_id
      # add :product_type to permit()
      params.require(:product).permit(:product_name, :product_price, :product_desc, :quantity, :local_delivery, :image_id)
    end

    def image_params
      params.require(:product).permit(:image_file)
    end
end
