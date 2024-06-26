# frozen_string_literal: true

RSpec.describe Magick::Draw, '#font_size' do
  it 'works' do
    draw = described_class.new
    image = Magick::Image.new(200, 200)

    draw.font_size(20)
    expect(draw.inspect).to eq('font-size 20')
    expect { draw.draw(image) }.not_to raise_error

    expect { draw.font_size('x') }.to raise_error(ArgumentError)
  end
end
