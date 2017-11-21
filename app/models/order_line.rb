class OrderLine < ApplicationRecord
    # sets foreign keys of order id to establish connections for usage
    belongs_to :order, :foreign_key => 'order_id'
    belongs_to :product, :foreign_key => 'product_id'
end
