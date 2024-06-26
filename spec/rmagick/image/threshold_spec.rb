# frozen_string_literal: true

RSpec.describe Magick::Image, '#threshold' do
  it 'works' do
    image = described_class.new(20, 20)

    result = image.threshold(100)
    expect(result).to be_instance_of(described_class)
  end
end
