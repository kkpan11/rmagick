# frozen_string_literal: true

require 'rmagick'

img = Magick::Image.read('images/Flower_Hat.jpg').first
rose = Magick::Image.read('images/Yellow_Rose.miff').first
begin
  img.affinity(rose)
rescue NotImplementedError
  img = Magick::Image.read('images/notimplemented.gif').first
end
img.write('remap.jpg')
