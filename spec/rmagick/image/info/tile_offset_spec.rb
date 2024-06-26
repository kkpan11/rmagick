# frozen_string_literal: true

RSpec.describe Magick::Image::Info, '#tile_offset' do
  it 'works' do
    info = described_class.new

    expect { info.tile_offset = '200x100' }.not_to raise_error
    expect(info.tile_offset).to eq('200x100')
    expect { info.tile_offset = Magick::Geometry.new(100, 200) }.not_to raise_error
    expect(info.tile_offset).to eq('100x200')
    expect { info.tile_offset = nil }.to raise_error(ArgumentError)
  end
end
