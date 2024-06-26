# frozen_string_literal: true

RSpec.describe Magick::Draw, '#pattern' do
  it 'works' do
    draw = described_class.new
    image = Magick::Image.new(200, 200)

    draw.pattern('hat', 0, 10.5, 20, '20') {}
    expect(draw.inspect).to eq("push defs\npush pattern hat 0 10.5 20 20\npush graphic-context\npop graphic-context\npop pattern\npop defs")
    expect { draw.draw(image) }.not_to raise_error

    expect { draw.pattern('hat', 'x', 0, 20, 20) {} }.to raise_error(ArgumentError)
    expect { draw.pattern('hat', 0, 'x', 20, 20) {} }.to raise_error(ArgumentError)
    expect { draw.pattern('hat', 0, 0, 'x', 20) {} }.to raise_error(ArgumentError)
    expect { draw.pattern('hat', 0, 0, 20, 'x') {} }.to raise_error(ArgumentError)
    expect { draw.pattern(Object.new, 'x', 0, 20, 20) }.to raise_error(TypeError)
  end
end
