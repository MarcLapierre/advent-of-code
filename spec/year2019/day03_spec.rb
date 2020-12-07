require 'spec_helper'

RSpec.describe Year2019::Day03 do
  # it "solves part1" do
  #   d = Year2019::Day03.new
  #   expect(d.part1(input)).to eq(159)
  # end

  # it "solves part2" do
  #   d = Year2019::Day03.new
  #   expect(d.part2('some_input')).to eq(nil)
  # end

  private

  def input
    <<~HEREDOC
    R75,D30,R83,U83,L12,D49,R71,U7,L72
    U62,R66,U55,R34,D71,R55,D58,R83
    HEREDOC
  end
end
