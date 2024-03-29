require 'spec_helper'

RSpec.describe Year2022::Day02 do
  it "solves part1" do
    d = Year2022::Day02.new
    expect(d.part1(input)).to eq(15)
  end

  it "solves part2" do
    d = Year2022::Day02.new
    expect(d.part2(input)).to eq(12)
  end

  private

  def input
    <<~HEREDOC
    A Y
    B X
    C Z
    HEREDOC
  end
end
