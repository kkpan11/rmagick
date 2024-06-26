# frozen_string_literal: true

RSpec.describe Magick::Draw, '#stroke_linecap' do
  it 'works' do
    draw = described_class.new
    image = Magick::Image.new(200, 200)

    draw.stroke_linecap('butt')
    expect(draw.inspect).to eq('stroke-linecap butt')
    expect { draw.draw(image) }.not_to raise_error

    draw = described_class.new
    draw.stroke_linecap('round')
    expect(draw.inspect).to eq('stroke-linecap round')
    expect { draw.draw(image) }.not_to raise_error

    draw = described_class.new
    draw.stroke_linecap('square')
    expect(draw.inspect).to eq('stroke-linecap square')
    expect { draw.draw(image) }.not_to raise_error

    expect { draw.stroke_linecap('foo') }.to raise_error(ArgumentError)
  end
end
