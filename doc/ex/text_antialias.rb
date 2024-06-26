# frozen_string_literal: true

require 'rmagick'

imgl = Magick::ImageList.new
imgl.new_image(275, 170) { |info| info.background_color = 'white' }

gc = Magick::Draw.new
gc.fill('black')
gc.stroke('transparent')

if RUBY_PLATFORM.include?('mingw')
  gc.font_family('Georgia')
  gc.pointsize(152)
else
  gc.font_family('courier')
  gc.pointsize(200)
end
gc.font_weight(Magick::BoldWeight)

# Turn off antialiasing
gc.text_antialias(false)
gc.text(15, 145, 'A')

# Turn it back on
gc.text_antialias(true)
gc.text(145, 145, 'A')

gc.draw(imgl)

# Blow up the image so we can
# easily see the image, then
# crop to a representative portion.
imgl.resize!(3).crop!(235, 270, 365, 180)
imgl.page = Magick::Rectangle.new(365, 180)
imgl.border!(1, 1, 'black')
imgl.write('text_antialias.gif')
exit
