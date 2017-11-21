class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :initialize_product
  
  def initialize_product
    @product = Product.new
  end

end
