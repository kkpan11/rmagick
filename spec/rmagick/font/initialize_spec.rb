# frozen_string_literal: true

RSpec.describe Magick::Font, '#initialize' do
  it 'accepts all stretch types' do
    Magick::StretchType.values do |stretch|
      font = described_class.new('Arial', 'font test', 'Arial family', Magick::NormalStyle, stretch, 400, nil, 'test foundry', 'test format')
      expect(font.to_s).to match(/stretch=#{stretch}/)
    end

    font = described_class.new('Arial', 'font test', 'Arial family', Magick::NormalStyle, nil, 400, nil, 'test foundry', 'test format')
    expect(font.to_s).to match(/stretch=UndefinedStretch/)
  end

  it 'accepts all style types' do
    Magick::StyleType.values do |style|
      font = described_class.new('Arial', 'font test', 'Arial family', style, Magick::NormalStretch, 400, nil, 'test foundry', 'test format')
      expect(font.to_s).to match(/style=#{style}/)
    end

    font = described_class.new('Arial', 'font test', 'Arial family', nil, Magick::NormalStretch, 400, nil, 'test foundry', 'test format')
    expect(font.to_s).to match(/style=UndefinedStyle/)
  end
end
