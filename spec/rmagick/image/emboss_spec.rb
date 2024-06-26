# frozen_string_literal: true

RSpec.describe Magick::Image, '#emboss' do
  it 'works' do
    image = described_class.new(20, 20)

    result = image.emboss
    expect(result).to be_instance_of(described_class)
    expect(result).not_to be(image)

    expect { image.emboss(1.0) }.not_to raise_error
    expect { image.emboss(1.0, 0.5) }.not_to raise_error
    expect { image.emboss(1.0, 0.5, 2) }.to raise_error(ArgumentError)
    expect { image.emboss(1.0, 'x') }.to raise_error(TypeError)
    expect { image.emboss('x', 1.0) }.to raise_error(TypeError)
  end
end
