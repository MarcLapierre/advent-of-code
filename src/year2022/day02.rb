module Year2022
  class Day02
    def part1(input)
      input.count('X') +
      input.count('Y') * 2 +
      input.count('Z') * 3 +
      input.scan(/(A Y|B Z|C X)/).count * 6 +
      input.scan(/(A X|B Y|C Z)/).count * 3
    end

    def part2(input)
      input.count('Y') * 3 +
      input.count('Z') * 6 +
      input.scan(/(B X|A Y|C Z)/).count +
      input.scan(/(C X|B Y|A Z)/).count * 2 +
      input.scan(/(A X|C Y|B Z)/).count * 3
    end
  end
end
