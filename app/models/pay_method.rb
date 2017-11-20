class PayMethod < ApplicationRecord
    # belongs_to :customer, :foreign_key => 'customer_id'
    validates :account_number, presence: true
    # validates_presence_of :customer_id 
    # validates :expiration_date, presence: true, :expiration_date > DateTime.now => true
end
