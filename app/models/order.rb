class Order < ApplicationRecord
    has_many :order_lines
    has_many :products, :through => :order_lines
    validates_presence_of :customer_id
end
