# frozen_string_literal: true

require 'rmagick'

# Demonstrate the Image#transpose method

img = Magick::Image.read('images/Flower_Hat.jpg').first
img = img.transpose
img.write('transpose.jpg')
exit
