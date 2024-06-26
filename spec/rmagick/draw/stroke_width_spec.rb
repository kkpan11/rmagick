# frozen_string_literal: true

RSpec.describe Magick::Draw, '#stroke_width' do
  it 'works' do
    draw = described_class.new
    image = Magick::Image.new(200, 200)

    draw.stroke_width(2.5)
    expect(draw.inspect).to eq('stroke-width 2.5')
    expect { draw.draw(image) }.not_to raise_error

    expect { draw.stroke_width('xxx') }.to raise_error(ArgumentError)
  end
end
