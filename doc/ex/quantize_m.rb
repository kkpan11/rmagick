# frozen_string_literal: true

# Demonstrate the ImageList#quantize method

require 'rmagick'

snapshots = Magick::ImageList.new 'images/Ballerina.jpg', 'images/Gold_Statue.jpg', 'images/Shorts.jpg'

# Quantize all 3 images to a single set of 16 colors in the RGB colorspace
$stdout.sync = true
printf 'Quantizing... Please be patient, this may take a couple of seconds... '
quant = snapshots.quantize 16
puts 'Done.'

# Now we create the "before" and "after" images.
# Arrange the original images side-by-side into a
# single image.
old = snapshots.append false
old.write('quantize_m_before.jpg')

# Repeat for the quantized images.
new = quant.append false
new.write('quantize_m_after.jpg')

exit
