class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def add_product_to_active_order
    puts "Adding product to order DAWG.  ID: #{:id}"
  end


  



end
