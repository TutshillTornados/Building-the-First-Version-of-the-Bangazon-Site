class Product < ApplicationRecord
    belongs_to :customer, :foreign_key => 'customer_id'
    belongs_to :product_type, :foreign_key => 'product_type_id'
    has_many :photos, as: :imageable, dependent: :destroy
    validates_presence_of :product_name, :product_price, :product_desc, :quantity, :product_added, :product_type_id
    validates :local_delivery, inclusion: { in: [true, false]}

    has_many :images, as: :imageable

    # validates price is no greater than 10 stacks
    validates :product_price, presence: true, format: { with: /\A?\d+(\.\d{2}?)?\z/ }, numericality: { greater_than: 0, less_than: 10000 }

    # validates curse words
    validates_exclusion_of :product_desc, :product_name, :in => :check_bad_words, :message => "This is not an acceptable word. Please try again"

    def check_bad_words
        @bad_words = File.read('app/assets/textfiles/badwords.txt').split 
    end

    # def self.search(search)
    #     if search
    #         self.where("product_name like ?", "%#{search}%")
    #       else
    #         self.all
    #       end
    #   end
end
