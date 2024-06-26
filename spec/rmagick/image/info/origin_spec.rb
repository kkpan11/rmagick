# frozen_string_literal: true

RSpec.describe Magick::Image::Info, '#origin' do
  it 'works' do
    info = described_class.new

    expect { info.origin = '+10+10' }.not_to raise_error
    expect(info.origin).to eq('+10+10')
    expect { info.origin = Magick::Geometry.new(nil, nil, 10, 10) }.not_to raise_error
    expect(info.origin).to eq('+10+10')
    expect { info.origin = nil }.not_to raise_error
    expect(info.origin).to be(nil)
    expect { info.origin = 'aaa' }.to raise_error(ArgumentError)
  end
end
