# frozen_string_literal: true

RSpec.describe Magick::Image, '#difference' do
  it 'works' do
    image1 = described_class.read(IMAGES_DIR + '/Button_0.gif').first
    image2 = described_class.read(IMAGES_DIR + '/Button_1.gif').first

    result = image1.difference(image2)
    expect(result).to be_instance_of(Array)
    expect(result.length).to eq(3)
    expect(result[0]).to be_instance_of(Float)
    expect(result[0]).not_to eq(0.0)
    expect(result[1]).to be_instance_of(Float)
    expect(result[1]).not_to eq(0.0)
    expect(result[2]).to be_instance_of(Float)
    expect(result[2]).not_to eq(0.0)

    expect { image1.difference(2) }.to raise_error(NoMethodError)
    image2.destroy!
    expect { image1.difference(image2) }.to raise_error(Magick::DestroyedImageError)
  end

  it 'accepts an ImageList argument' do
    image = described_class.new(20, 20)

    image_list = Magick::ImageList.new
    image_list.new_image(20, 20)
    expect { image.difference(image_list) }.not_to raise_error
  end
end
