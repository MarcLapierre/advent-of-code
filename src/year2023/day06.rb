module Year2023
  class Day06
    def part1(input)
      races = input.split("\n").map { |line| line.split.drop(1).map(&:to_i) }.transpose
      races.map do |time, distance|
        first_win = (1..time).detect { |i| i * (time - i) > distance }
        time - (2 * (first_win - 1)) - 1
      end.reduce(&:*)
    end

    def part2(input)
      time, distance = input.split("\n").map { |line| line.split.drop(1).join.to_i }
      first_win = (1..time).detect { |i| i * (time - i) > distance }
      time - (2 * (first_win - 1)) - 1
    end
  end
end
