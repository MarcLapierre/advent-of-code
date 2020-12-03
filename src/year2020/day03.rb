module Year2020
  class Day03
    def part1(input)
      lines = input.chomp.split("\n")
      count = 0
      y = 0
      lines.shift
      lines.each do |line|
        y += 3
        y -= line.length if y >= line.length
        count += 1 if line[y] == '#'
      end
      count
    end

    def part2(input)
      lines = input.chomp.split("\n")
      slopes = [
        { right: 1, down: 1 },
        { right: 3, down: 1 },
        { right: 5, down: 1 },
        { right: 7, down: 1 },
        { right: 1, down: 2 }
      ]

      counts = slopes.map do |slope|
        count = 0
        y = 0
        lines_clone = lines.clone
        lines_clone.shift
        lines_clone.each_with_index do |line, index|
          next unless (index + 1) % slope[:down] == 0
          y += slope[:right]
          y -= line.length if y >= line.length
          count += 1 if line[y] == '#'
        end
        count
      end
      counts.reduce(:*)
    end
  end
end
