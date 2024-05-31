# frozen_string_literal: true

require 'rmagick'

# Demonstrate Image#shade

img = Magick::Image.read('images/Flower_Hat.jpg').first

img = img.shade(true, 50, 50)

img.write('shade.jpg')
exit
