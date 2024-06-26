# frozen_string_literal: true

RSpec.describe Magick::Image, '#mask' do
  it 'works' do
    image1 = described_class.new(20, 20)
    cimage = described_class.new(10, 10)

    image1.mask(cimage)

    result = image1.mask
    expect(result).not_to be(nil)
    expect(result).not_to be(cimage)
    expect(result.columns).to eq(20)
    expect(result.rows).to eq(20)

    expect { image1.mask(cimage, 'x') }.to raise_error(ArgumentError)
    # mask expects an Image and calls `cur_image'
    expect { image1.mask = 2 }.to raise_error(NoMethodError)

    image2 = image1.copy.freeze
    expect { image2.mask cimage }.to raise_error(FrozenError)

    image1.destroy!
    expect { image1.mask cimage }.to raise_error(Magick::DestroyedImageError)
  end

  it 'accepts an ImageList argument' do
    image = described_class.new(20, 20)

    image_list = Magick::ImageList.new
    image_list.new_image(10, 10)
    expect { image.mask(image_list) }.not_to raise_error
  end
end
