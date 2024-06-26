# frozen_string_literal: true

RSpec.describe Magick::Image::Info, '#size' do
  it 'works' do
    info = described_class.new

    expect { info.size = '200x100' }.not_to raise_error
    expect(info.size).to eq('200x100')
    expect { info.size = Magick::Geometry.new(100, 200) }.not_to raise_error
    expect(info.size).to eq('100x200')
    expect { info.size = nil }.not_to raise_error
    expect(info.size).to be(nil)
    expect { info.size = 'aaa' }.to raise_error(ArgumentError)
  end
end
