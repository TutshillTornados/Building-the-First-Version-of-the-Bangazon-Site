class OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def add_product_to_active_order
    puts "Adding product to order DAWG.  ID: #{:id}"
  end


  
  def check_active_order
    # order_status_array_of_array comes back as an array of one
    order_status_array_of_array = @order.retrieve_active_order(@active_customer[0])
    order_status_array_of_one = order_status_array_of_array.flatten
    # Create new order if there is no active order
    if order_status_array_of_one.length != 0
      @order_status = order_status_array_of_one[0]
      # puts "order status: #{@order_status}"
      return @order_status
    else
      return create_order
    end
  end

  # Creates new order for active customer
  def create_order
    @order_status = @order.new_order(@active_customer[0])
    # puts "order status from create_order: #{@order_status}"
    return @order_status
  end


end
