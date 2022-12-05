module Year2022
  class Day03
    def part1(input)
      input.split.map do |line|
        char = matching_chars(line[0...line.size/2], line[line.size/2..])
        calc_value(char.ord)
      end.sum
    end

    def part2(input)
      input.split.each_slice(3).map do |lines|
        char = lines.reduce { |l1, l2| matching_chars(l1, l2) }
        calc_value(char.ord)
      end.sum
    end

    private

    def matching_chars(line1, line2)
      line1.scan(/[#{line2}]/).join
    end

    def calc_value(char)
      char > 96 ? char - 96 : char - 38
    end
  end
end
