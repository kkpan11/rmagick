# frozen_string_literal: true

RSpec.describe Magick::Image, '#roll' do
  it 'works' do
    image = described_class.new(20, 20)

    result = image.roll(5, 5)
    expect(result).to be_instance_of(described_class)
  end
end
