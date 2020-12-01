require 'spec_helper'

RSpec.describe Year2020::Day01 do
  it "solves part1" do
    d = Year2020::Day01.new
    expect(d.part1(test_input)).to eq(1020000)
  end

  it "solves part2" do
    d = Year2020::Day01.new
    expect(d.part2(test_input)).to eq(214200000)
  end

  private

  def test_input
    "100\n300\n700\n1000\n1020\n"
  end
end
