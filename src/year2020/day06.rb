module Year2020
  class Day06
    def part1(input)
      input.chomp.split("\n\n").map { |g| g.gsub("\n", '').chars.uniq.count }.reduce(:+)
    end

    def part2(input)
      input.chomp.split("\n\n").map { |g| g.split("\n").reduce { |g, h| (g.chars & h.chars).join }.length }.reduce(:+)
    end
  end
end
