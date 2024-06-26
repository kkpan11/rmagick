# frozen_string_literal: true

RSpec.describe Magick::ImageList, "#quantize" do
  it "works" do
    image_list = described_class.new

    image_list.read(IMAGES_DIR + '/Button_0.gif', IMAGES_DIR + '/Button_1.gif')

    result = image_list.quantize
    expect(result).to be_instance_of(described_class)
    expect(result.scene).to eq(1)

    expect { image_list.quantize(128) }.not_to raise_error
    expect { image_list.quantize('x') }.to raise_error(TypeError)
    expect { image_list.quantize(128, Magick::RGBColorspace) }.not_to raise_error
    expect { image_list.quantize(128, 'x') }.to raise_error(TypeError)
    expect { image_list.quantize(128, Magick::RGBColorspace, true, 0) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, true) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, false) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, Magick::NoDitherMethod) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, Magick::RiemersmaDitherMethod) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, Magick::FloydSteinbergDitherMethod) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, Magick::FloydSteinbergDitherMethod, 32) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, Magick::FloydSteinbergDitherMethod, 32, true) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, Magick::FloydSteinbergDitherMethod, 32, false) }.not_to raise_error
    expect { image_list.quantize(128, Magick::RGBColorspace, true, 'x') }.to raise_error(TypeError)
    expect { image_list.quantize(128, Magick::RGBColorspace, true, 0, false, 'extra') }.to raise_error(ArgumentError)
  end
end
