class PayMethod < ApplicationRecord
    validates :account_number, presence: true
    # validates :expiration_date, presence: true, date: {date: > date.now()}
    belongs_to :customer, :foreign_key => 'customer_id'
    
    # Check to validate epiration dates for Payments
    # validate :happened_at_is_valid_datetime
  
    #   def happened_at_is_valid_datetime
    #     errors.add(:happened_at, 'must be a valid datetime') if ((DateTime.parse(happened_at) rescue ArgumentError) == ArgumentError)
    #   end

end
