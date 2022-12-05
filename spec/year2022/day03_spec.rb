require 'spec_helper'

RSpec.describe Year2022::Day03 do
  it "solves part1" do
    d = Year2022::Day03.new
    expect(d.part1(input)).to eq(157)
  end

  it "solves part2" do
    d = Year2022::Day03.new
    expect(d.part2(input)).to eq(70)
  end

  private

  def input
    <<~HEREDOC
    vJrwpWtwJgWrhcsFMMfFFhFp
    jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    PmmdzqPrVvPwwTWBwg
    wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    ttgJtRGJQctTZtZT
    CrZsJsPPZsGzwwsLwLmpwMDw
    HEREDOC
  end
end
