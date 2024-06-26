# frozen_string_literal: true

RSpec.describe Magick::Image, '#from_blob' do
  it 'returns an image equal to the original' do
    image = described_class.read(IMAGES_DIR + '/Button_0.gif').first
    blob = image.to_blob

    expect(blob).to be_instance_of(String)
    result = described_class.from_blob(blob)
    expect(result).to be_instance_of(Array)
    expect(result.first).to be_instance_of(described_class)
    expect(result.first).to eq image
  end

  it 'sync Image::Info' do
    image = described_class.read(IMAGES_DIR + '/Button_0.gif').first
    blob = image.to_blob

    result = described_class.from_blob(blob) do |options|
      options.colorspace = Magick::LabColorspace
    end
    expect(result.first.colorspace).to eq(Magick::LabColorspace)
  end
end
