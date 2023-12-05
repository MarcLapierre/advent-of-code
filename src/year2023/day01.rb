module Year2023
  class Day01
    def part1(input)
      input.lines.map do |line|
        matches = line.scan(/\d/)
        "#{matches[0]}#{matches[-1]}".to_i
      end.sum
    end

    def part2(input)
      num_map = {
        'one' => '1',
        'two' => '2',
        'three' => '3',
        'four' => '4',
        'five' => '5',
        'six' => '6',
        'seven' => '7',
        'eight' => '8',
        'nine' => '9',
      }
      keys = /(#{num_map.keys.join('|')})/
      input.lines.map do |line|
        line = line.gsub(/oneight/, '18').gsub(/twone/, '21').gsub(/eightwo/, '82').gsub(/eighthree/, '83')
        while res = line.match(keys) do
          line = line.sub(res[1], num_map[res[1]])
        end
        matches = line.scan(/\d/)
        "#{matches[0]}#{matches[-1]}".to_i
      end.sum
    end
  end
end
