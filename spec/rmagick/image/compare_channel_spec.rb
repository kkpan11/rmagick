# frozen_string_literal: true

RSpec.describe Magick::Image, "#compare_channel" do
  it "works" do
    image1 = described_class.read(IMAGES_DIR + '/Button_0.gif').first
    image2 = described_class.read(IMAGES_DIR + '/Button_1.gif').first

    Magick::MetricType.values do |metric|
      expect { image1.compare_channel(image2, metric) }.not_to raise_error
    end
    expect { image1.compare_channel(image2, 2) }.to raise_error(TypeError)
    expect { image1.compare_channel }.to raise_error(ArgumentError)

    expect { image1.compare_channel(image2, Magick::MeanAbsoluteErrorMetric, Magick::RedChannel) }.not_to raise_error
    expect { image1.compare_channel(image2, Magick::MeanAbsoluteErrorMetric, Magick::RedChannel, Magick::BlueChannel) }.not_to raise_error
    expect { image1.compare_channel(image2, Magick::MeanAbsoluteErrorMetric, 2) }.to raise_error(TypeError)
    expect { image1.compare_channel(image2, Magick::MeanAbsoluteErrorMetric, Magick::RedChannel, 2) }.to raise_error(TypeError)

    result = image1.compare_channel(image2, Magick::MeanAbsoluteErrorMetric)
    expect(result).to be_instance_of(Array)
    expect(result[0]).to be_instance_of(described_class)
    expect(result[1]).to be_instance_of(Float)

    image2.destroy!
    expect { image1.compare_channel(image2, Magick::MeanAbsoluteErrorMetric) }.to raise_error(Magick::DestroyedImageError)
  end

  it 'accepts an ImageList argument' do
    image = described_class.new(20, 20)

    image_list = Magick::ImageList.new
    image_list.new_image(20, 20)
    expect { image.compare_channel(image_list, Magick::MeanAbsoluteErrorMetric) }.not_to raise_error
    expect { image.compare_channel(image_list, Magick::MeanAbsoluteErrorMetric, Magick::RedChannel) }.not_to raise_error
  end
end
