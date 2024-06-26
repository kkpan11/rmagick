# frozen_string_literal: true

RSpec.describe Magick::Pixel, '#clone' do
  it 'works' do
    pixel = described_class.from_color('brown')

    pixel2 = pixel.clone
    expect(pixel2).to eq(pixel)
    expect(pixel2.object_id).not_to eq(pixel.object_id)

    pixel2 = pixel.freeze.clone
    expect(pixel2.frozen?).to be(true)
  end
end
