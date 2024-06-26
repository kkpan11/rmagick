# frozen_string_literal: true

RSpec.describe Magick::Draw, '#dup' do
  it 'works' do
    draw = described_class.new

    draw.path('M110,100 h-75 a75,75 0 1,0 75,-75 z')
    draw.freeze
    dup = draw.dup
    expect(dup).to be_instance_of(described_class)
  end
end
