# frozen_string_literal: true

require 'rmagick'

# Demonstrate the Image#normalize method

img = Magick::Image.read('images/Hot_Air_Balloons.jpg').first

img = img.normalize

img.write('normalize.jpg')
exit
