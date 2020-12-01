require 'spec_helper'

RSpec.describe Year2019::Day02 do
  it "solves part1" do
    d = Year2019::Day02.new
    expect(d.part1(input)).to eq(3500)
  end

  it "solves part2" do
    d = Year2019::Day02.new
    expect(d.part2(input)).to eq(707)
  end

  private

  def input
    '1,9,10,3,2,3,11,0,99,30,40,50'
  end
end
