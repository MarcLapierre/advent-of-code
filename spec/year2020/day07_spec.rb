require 'spec_helper'

RSpec.describe Year2020::Day07 do
  # it "solves part1" do
  #   d = Year2020::Day07.new
  #   expect(d.part1('some_input')).to eq('expected_result')
  # end

  it "solves part2" do
    d = Year2020::Day07.new
    expect(d.part2(input)).to eq(126)
  end

  private

  def input
    <<~HEREDOC
    shiny gold bags contain 2 dark red bags.
    dark red bags contain 2 dark orange bags.
    dark orange bags contain 2 dark yellow bags.
    dark yellow bags contain 2 dark green bags.
    dark green bags contain 2 dark blue bags.
    dark blue bags contain 2 dark violet bags.
    dark violet bags contain no other bags.
    HEREDOC
  end
end
