# frozen_string_literal: true

# Demonstrate flatten_images method. Create an image with a drop-shadow effect.

require 'rmagick'

TEXT = 'RMagick'

i = Magick::ImageList.new

# Create a background image with a gradient fill
i.new_image(200, 100, Magick::GradientFill.new(100, 50, 100, 50, 'khaki1', 'turquoise'))

# Create a transparent image for the text shadow
i.new_image(200, 100) { |info| info.background_color = 'transparent' }
primitives = Magick::Draw.new
primitives.annotate i, 0, 0, 2, 2, TEXT do |options|
  options.pointsize = 32
  options.fill = 'gray50'
  options.gravity = Magick::CenterGravity
end

# Create another transparent image for the text itself
i.new_image(200, 100) { |info| info.background_color = 'transparent' }
primitives = Magick::Draw.new
primitives.annotate i, 0, 0, -2, -2, TEXT do |options|
  options.pointsize = 32
  options.fill = 'red'
  options.stroke = 'black'
  options.gravity = Magick::CenterGravity
end

# Flatten all 3 into a single image.
# i.display
i.flatten_images.write 'flatten_images.gif'
exit
