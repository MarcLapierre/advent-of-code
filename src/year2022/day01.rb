module Year2022
  class Day01
    def part1(input)
      results = parse_input
      results.max
    end

    def part2(input)
      results = parse_input
      results.sort.last(3).sum
    end

    private

    def parse_input
      @parse_input ||= File.read("input/2022/day-01").split("\n\n").map do |chunk|
        chunk.split.map(&:to_i).sum
      end
    end
  end
end
