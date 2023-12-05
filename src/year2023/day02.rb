module Year2023
  class Day02
    def part1(input)
      input.lines.filter_map do |line|
        game_id, reveals = line.split(':')
        game_id = game_id[/\d+/].to_i
        totals = calculate_dice(reveals)
        totals['red'] <= 12 && totals['green'] <= 13 && totals['blue'] <= 14 ? game_id : nil
      end.sum
    end

    def part2(input)
      input.lines.filter_map do |line|
        game_id, reveals = line.split(':')
        game_id = game_id[/\d+/].to_i
        totals = calculate_dice(reveals)
        totals['red'] * totals['green'] * totals['blue']
      end.sum
    end

    private

    def calculate_dice(reveals)
      totals = { 'red' => 0, 'green' => 0, 'blue' => 0 }
      reveals.split(';').map do |reveal|
        reveal.strip.split(',').each do |group|
          count = group[/\d+/].to_i
          color = group[/[a-z]+/]
          totals[color] = [count, totals[color]].max
        end
      end
      totals
    end
  end
end
