# frozen_string_literal: true

RSpec.describe Magick::Image, "#affine_transform" do
  it "works" do
    image = described_class.new(20, 20)

    affine = Magick::AffineMatrix.new(1, Math::PI / 6, Math::PI / 6, 1, 0, 0)
    expect { image.affine_transform(affine) }.not_to raise_error
    expect { image.affine_transform(0) }.to raise_error(TypeError)
    result = image.affine_transform(affine)
    expect(result).to be_instance_of(described_class)
  end
end
