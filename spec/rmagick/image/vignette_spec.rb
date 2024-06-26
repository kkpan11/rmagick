# frozen_string_literal: true

RSpec.describe Magick::Image, '#vignette' do
  it 'works' do
    image = described_class.new(20, 20)

    result = image.vignette
    expect(result).to be_instance_of(described_class)
    expect(image).not_to be(result)

    expect { image.vignette(0) }.not_to raise_error
    expect { image.vignette(0, 0) }.not_to raise_error
    expect { image.vignette(0, 0, 0) }.not_to raise_error
    expect { image.vignette(0, 0, 0, 1) }.not_to raise_error
    # too many arguments
    expect { image.vignette(0, 0, 0, 1, 1) }.to raise_error(ArgumentError)
  end
end
