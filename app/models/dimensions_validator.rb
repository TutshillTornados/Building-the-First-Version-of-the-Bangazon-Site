class DimensionsValidator < ActiveModel::EachValidator
  # sets limits for image size using paperclip and simple form
    def validate_each(record, attribute, value)
      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
      width = options[:width]
      height = options[:height]
      # Checks height and width limits of photo
      record.errors[attribute] << "Width must be #{width}px" unless dimensions.width == width
      record.errors[attribute] << "Height must be #{height}px" unless dimensions.height == height
    end
  end