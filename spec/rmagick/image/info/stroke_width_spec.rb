# frozen_string_literal: true

RSpec.describe Magick::Image::Info, '#stroke_width' do
  it 'works' do
    info = described_class.new

    expect { info.stroke_width = 10 }.not_to raise_error
    expect(info.stroke_width).to eq(10)
    expect { info.stroke_width = 5.25 }.not_to raise_error
    expect(info.stroke_width).to eq(5.25)
    expect { info.stroke_width = nil }.not_to raise_error
    expect(info.stroke_width).to be(nil)
    expect { info.stroke_width = 'xxx' }.to raise_error(TypeError)
  end
end
