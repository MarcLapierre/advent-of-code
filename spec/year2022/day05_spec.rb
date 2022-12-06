require 'spec_helper'

RSpec.describe Year2022::Day05 do
  it "solves part1" do
    d = Year2022::Day05.new
    expect(d.part1(input)).to eq('CMZ')
  end

  it "solves part2" do
    d = Year2022::Day05.new
    expect(d.part2(input)).to eq('MCD')
  end

  private

  def input
    <<~HEREDOC
        [D]
    [N] [C]
    [Z] [M] [P]
    1   2   3

    move 1 from 2 to 1
    move 3 from 1 to 3
    move 2 from 2 to 1
    move 1 from 1 to 2
    HEREDOC
  end
end
