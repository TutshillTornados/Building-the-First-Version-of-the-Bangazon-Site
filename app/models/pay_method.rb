class PayMethod < ApplicationRecord
    # Checks information to make sure all data that is needed is present
    belongs_to :customer, :foreign_key => 'customer_id'
    validates :payment_type, presence: true
    validates :account_number, presence: true,
                                length: { minimum: 16 }
    validate :expiration_date_cannot_be_in_the_past 
    
    # Sets expiration date requirment for payment method to be a future date
    def expiration_date_cannot_be_in_the_past
        if expiration_date.present? && expiration_date < Date.today
          errors.add(:expiration_date, "can't be in the past")
        end
    end
        
end
