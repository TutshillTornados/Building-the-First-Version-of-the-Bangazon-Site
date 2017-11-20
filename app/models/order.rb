class Order < ApplicationRecord
    has_many :order_lines
    has_many :products, :through => :order_lines
    validates_presence_of :customer_id

    # function to retrieve order_id of the user's active order
    def retrieve_active_order
        customer_id = session[:user_id]
        all_orders = index

        @active_order_id = @db.execute("SELECT id FROM Orders WHERE pay_method_id IS NULL AND customer_id = #{customer_id}")

        # puts "retrieve Active order method return: #{@active_order_id}"
        return @active_order_id
    end

    
end
