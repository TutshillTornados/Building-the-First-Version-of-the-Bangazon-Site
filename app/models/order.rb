class Order < ApplicationRecord
    has_many :order_lines
    has_many :products, :through => :order_lines
    belongs_to :customer, :foreign_key => 'customer_id'
    validates_presence_of :customer_id, presence: true
    has_one :pay_method_id, :through => :pay_method
end
