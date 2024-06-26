# frozen_string_literal: true

require 'rmagick'

NUM_COLORS = 256
HIST_HEIGHT = 200

img = Magick::Image.read('images/Hot_Air_Balloons_H.jpg').first
img = img.quantize(NUM_COLORS)

hist = img.color_histogram

# sort pixels by increasing count
pixels = hist.keys.sort_by { |pixel| hist[pixel] }

scale = HIST_HEIGHT / (hist.values.max * 1.025) # put 2.5% air at the top

gc = Magick::Draw.new
gc.stroke_width(1)
gc.affine(1, 0, 0, -scale, 0, HIST_HEIGHT)

# handle images with fewer than NUM_COLORS colors
start = NUM_COLORS - img.number_colors

pixels.each do |pixel|
  gc.stroke(pixel.to_color)
  gc.line(start, 0, start, hist[pixel])
  start = start.succ
end

hatch = Magick::HatchFill.new('white', 'gray95')
canvas = Magick::Image.new(NUM_COLORS, HIST_HEIGHT, hatch)
gc.draw(canvas)

text = Magick::Draw.new
text.annotate(canvas, 0, 0, 0, 20, "Color Frequency\nHistogram") do |options|
  options.pointsize = 10
  options.gravity = Magick::NorthGravity
  options.stroke = 'transparent'
end

canvas.border!(1, 1, 'white')
canvas.border!(1, 1, 'black')
canvas.border!(3, 3, 'white')
canvas.write('color_histogram.gif')

exit
