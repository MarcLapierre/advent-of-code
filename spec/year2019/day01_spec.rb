require 'spec_helper'

RSpec.describe Year2019::Day01 do
  it "solves part1" do
    d = Year2019::Day01.new
    expect(d.part1(inputs)).to eq(176)
  end

  it "solves part2" do
    d = Year2019::Day01.new
    expect(d.part2(inputs)).to eq(236)
  end

  private

  def inputs
    "30\n50\n120\n355"
  end
end
