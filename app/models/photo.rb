class Photo < ApplicationRecord
    belongs_to :imageable, polymorphic: true
    # Sets image limits using size options
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },
                                                default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /image\/.*\z/
    # validates_with AttachmentSizeValidator, attributes: :product, less_than: 5.megabytes
    # validates :images[], numericality: { less_than_or_equal_to: 5120 }
end
