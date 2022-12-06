module Year2022
  class Day06
    def part1(input)
      input.chars.each_cons(4).find_index { |s| s.uniq == s } + 4
    end

    def part2(input)
      input.chars.each_cons(14).find_index { |s| s.uniq == s } + 14
    end
  end
end
