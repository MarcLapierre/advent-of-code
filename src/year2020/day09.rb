module Year2020
  class Day09
    def part1(input)
      lines = input.split.map(&:to_i)
      cursor = 25

      loop do
        return lines[cursor] unless lines[cursor-25..cursor-1].combination(2).any? { |a, b| a + b == lines[cursor] }
        cursor += 1
      end
    end

    def part2(input)
      lines = input.split.map(&:to_i)
      key = part1(input)
      lower_cursor = 0
      upper_cursor = 1

      loop do
        segment = lines[lower_cursor..upper_cursor]
        sum = segment.sum
        return segment.min + segment.max if sum == key
        if sum < key
          upper_cursor += 1
        else
          lower_cursor += 1
        end
      end
    end
  end
end
