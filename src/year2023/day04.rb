module Year2023
  class Day04
    def part1(input)
      input.lines.filter_map do |line|
        card_num = line[/(\d+):/][0].to_i
        winning = line[/:.+\|/][2..-3].split(' ').map(&:to_i)
        numbers = line[/\|.+/][2..].split(' ').map(&:to_i)
        matches = winning & numbers
        2**(matches.count-1) if matches.count > 0
      end.sum
    end

    def part2(input)
      cards = {}
      input.lines.length.times { |t| cards[t] = 0 }
      input.lines.each_with_index do |line, idx|
        card_num = line[/(\d+):/][0].to_i
        winning = line[/:.+\|/][2..-3].split(' ').map(&:to_i)
        numbers = line[/\|.+/][2..].split(' ').map(&:to_i)

        cards[idx] += 1
        next unless matches = winning & numbers
        (1..matches.count).each do |j|
          cards[idx + j] += cards[idx] if cards.key?(idx + j)
        end
      end
      cards.values.sum
    end
  end
end
