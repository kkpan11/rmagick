# frozen_string_literal: true

RSpec.describe Magick::Image, '#set_channel_depth' do
  it 'works' do
    image = described_class.new(20, 20)

    Magick::ChannelType.values do |ch|
      expect { image.set_channel_depth(ch, 8) }.not_to raise_error
    end
  end
end
