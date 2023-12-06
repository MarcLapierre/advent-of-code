require 'spec_helper'

RSpec.describe Year2023::Day06 do
  it "solves part1" do
    d = Year2023::Day06.new
    expect(d.part1(input)).to eq(288)
  end

  it "solves part2" do
    d = Year2023::Day06.new
    expect(d.part2(input)).to eq(71503)
  end

  private

  def input
    <<~HEREDOC
      Time:      7  15   30
      Distance:  9  40  200
    HEREDOC
  end

end
