require 'spec_helper'

RSpec.describe Year2023::Day07 do
  it "solves part1" do
    d = Year2023::Day07.new
    expect(d.part1(input)).to eq(6440)
  end

  it "solves part2" do
    d = Year2023::Day07.new
    expect(d.part2(input)).to eq(5905)
  end

  private

  def input
    <<~HEREDOC
      32T3K 765
      T55J5 684
      KK677 28
      KTJJT 220
      QQQJA 483
    HEREDOC
  end

end
