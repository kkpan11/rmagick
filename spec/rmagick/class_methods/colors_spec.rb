# frozen_string_literal: true

RSpec.describe Magick, '.colors' do
  it 'works' do
    result = described_class.colors
    expect(result).to be_instance_of(Array)
    result.each do |c|
      expect(c).to be_instance_of(Magick::Color)
      expect(c.name).to be_instance_of(String)
      expect(c.compliance).to be_instance_of(Magick::ComplianceType) unless c.compliance.nil?
      expect(c.color).to be_instance_of(Magick::Pixel)
    end
    described_class.colors { |c| expect(c).to be_instance_of(Magick::Color) }
  end
end
