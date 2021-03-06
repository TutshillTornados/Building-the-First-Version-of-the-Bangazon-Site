class Order < ApplicationRecord
    # Requirments for order set below.  
    has_many :order_lines
    has_many :products, :through => :order_lines
    belongs_to :customer, :foreign_key => 'customer_id'
    validates_presence_of :customer_id
end
