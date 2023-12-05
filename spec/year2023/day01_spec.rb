require 'spec_helper'

RSpec.describe Year2023::Day01 do
  it "solves part1" do
    d = Year2023::Day01.new
    expect(d.part1(input1)).to eq(142)
  end

  it "solves part2" do
    d = Year2023::Day01.new
    expect(d.part2(input2)).to eq(281)
  end

  private

  def input1
    <<~HEREDOC
    1abc2
    pqr3stu8vwx
    a1b2c3d4e5f
    treb7uchet
    HEREDOC
  end


  def input2
    <<~HEREDOC
    two1nine
    eightwothree
    abcone2threexyz
    xtwone3four
    4nineeightseven2
    zoneight234
    7pqrstsixteen
    HEREDOC
  end

end
