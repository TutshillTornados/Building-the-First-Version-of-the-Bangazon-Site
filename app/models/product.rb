class Product < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    belongs_to :product_type, :foreign_key => 'product_type_id'
    # belongs_to :image, :foreign_key => 'image_id'

    # add :product_type to validates_presence_of >
    validates_presence_of :product_name, :product_price, :product_desc, :quantity, :product_added, :product_type_id
    validates :local_delivery, inclusion: { in: [true, false]}

    validates :product_price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }, numericality: { greater_than: 0, less_than: 10000 }
    
    validates_exclusion_of :product_desc, :product_name, :in => :check_bad_words, :message => "This is not an acceptable word. Please try again"

    def check_bad_words
        @bad_words = File.read('app/assets/textfiles/badwords.txt').split
        p @bad_words  
        # errors.add_to_base("This is not an acceptable word. Please try again") if @bad_words.include? :product_desc
    end

    #validates curse words
end
