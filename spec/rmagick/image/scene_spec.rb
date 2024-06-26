# frozen_string_literal: true

RSpec.describe Magick::Image, '#scene' do
  it 'works' do
    image1 = described_class.new(100, 100)
    image_list = Magick::ImageList.new
    image_list << image1
    image2 = image1.copy
    image_list << image2
    image_list.write('temp.gif')
    FileUtils.rm('temp.gif')

    expect { image2.scene }.not_to raise_error
    expect(image1.scene).to eq(0)
    expect(image2.scene).to eq(1)
    expect { image2.scene = 2 }.to raise_error(NoMethodError)
  end
end
