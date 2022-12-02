module Year2022
  class Day01
    def part1(input)
      input.split("\n\n").map { |c| c.split.map(&:to_i).sum }.max
    end

    def part2(input)
      input.split("\n\n").map { |c| c.split.map(&:to_i).sum }.sort.last(3).sum
    end
  end
end
