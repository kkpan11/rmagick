# frozen_string_literal: true

require 'rmagick'

# Demonstrate the Image#raise method.
img = Magick::Image.read('images/Flower_Hat.jpg').first
img = img.raise
img.write('raise.jpg')
exit
