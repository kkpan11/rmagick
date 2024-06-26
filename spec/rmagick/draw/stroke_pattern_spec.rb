# frozen_string_literal: true

RSpec.describe Magick::Draw, '#stroke_pattern' do
  it 'works' do
    draw = described_class.new
    image = Magick::Image.new(200, 200)

    draw.stroke_pattern('red')
    expect(draw.inspect).to eq('stroke "red"')
    draw.rectangle(10, '10', 100, 100)
    expect { draw.draw(image) }.not_to raise_error

    # expect { draw.stroke_pattern(100) }.to raise_error(ArgumentError)
  end
end
