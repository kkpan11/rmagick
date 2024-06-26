# frozen_string_literal: true

RSpec.describe Magick::Draw, '#interword_spacing' do
  it 'accepts a valid parameter without raising an error' do
    draw = described_class.new

    expect { draw.interword_spacing(1) }.not_to raise_error
  end

  it 'raises an error when given an invalid parameter' do
    draw = described_class.new

    expect { draw.interword_spacing('a') }.to raise_error(ArgumentError)
    expect { draw.interword_spacing([]) }.to raise_error(TypeError)
  end

  it 'works' do
    draw = described_class.new
    image = Magick::Image.new(200, 200)

    draw.interword_spacing(40.5)
    expect(draw.inspect).to eq('interword-spacing 40.5')
    expect { draw.draw(image) }.not_to raise_error

    draw = described_class.new
    draw.interword_spacing('40.5')
    expect(draw.inspect).to eq('interword-spacing 40.5')
    expect { draw.draw(image) }.not_to raise_error

    draw = described_class.new
    draw.interword_spacing(1/4r)
    expect(draw.inspect).to eq('interword-spacing 0.25')
    expect { draw.draw(image) }.not_to raise_error

    # expect { draw.interword_spacing(Float::NAN) }.to raise_error(ArgumentError)
    expect { draw.interword_spacing('nan') }.to raise_error(ArgumentError)
    expect { draw.interword_spacing('xxx') }.to raise_error(ArgumentError)
    expect { draw.interword_spacing(nil) }.to raise_error(TypeError)
  end
end
