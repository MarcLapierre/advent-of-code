require 'spec_helper'

RSpec.describe Year2022::Day06 do
  it "solves part1" do
    d = Year2022::Day06.new
    expect(d.part1(input)).to eq(7)
  end

  it "solves part2" do
    d = Year2022::Day06.new
    expect(d.part2(input)).to eq(19)
  end

  private

  def input
    "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
  end
end
