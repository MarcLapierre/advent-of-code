require 'spec_helper'

RSpec.describe Year2023::Day03 do
  it "solves part1" do
    d = Year2023::Day03.new
    expect(d.part1(input)).to eq(4361)
  end

  it "solves part2" do
    d = Year2023::Day03.new
    expect(d.part2(input)).to eq(467835)
  end

  private

  def input
    <<~HEREDOC
    467..114..
    ...*......
    ..35..633.
    ......#...
    617*......
    .....+.58.
    ..592.....
    ......755.
    ...$.*....
    .664.598..
    HEREDOC
  end

end