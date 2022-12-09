require 'spec_helper'

RSpec.describe Year2022::Day08 do
  it "solves part1" do
    d = Year2022::Day08.new
    expect(d.part1(input)).to eq(21)
  end

  it "solves part2" do
    d = Year2022::Day08.new
    expect(d.part2(input)).to eq(8)
  end

  private

  def input
    <<~HEREDOC
    30373
    25512
    65332
    33549
    35390
    HEREDOC
  end
end
