# frozen_string_literal: true

RSpec.describe Magick::GradientFill, '#fill' do
  it 'works' do
    image = Magick::Image.new(10, 10)

    gradient = described_class.new(0, 0, 0, 0, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(0, 0, 0, 10, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(0, 0, 10, 0, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(0, 0, 10, 10, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(0, 0, 5, 20, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(-10, 0, -10, 10, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(0, -10, 10, -10, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(0, -10, 10, -20, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    gradient = described_class.new(0, 100, 100, 200, '#900', '#000')
    obj = gradient.fill(image)
    expect(obj).to eq(gradient)

    imgl = Magick::ImageList.new
    imgl.new_image(10, 10)

    gradient = described_class.new(0, 0, 0, 0, '#900', '#000')
    obj = gradient.fill(imgl)
    expect(obj).to eq(gradient)
  end
end
