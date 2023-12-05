module Year2023
  class Day05
    DESTINATION = 0
    SOURCE = 1
    COUNT = 2

    def part1(input)
      maps_inputs = input.split("\n\n")
      seeds = maps_inputs.shift.split(' ').drop(1).map(&:to_i)
      maps = maps_inputs.each_with_object([]) do |map_input, result|
        result << map_input.split("\n").drop(1).map { |row| row.split(' ').map(&:to_i) }
      end
      seeds.map do |seed|
        maps.reduce(seed) do |position, map|
          sequence = map.detect { |row| row[SOURCE] <= position && position < row[SOURCE] + row[COUNT] }
          sequence ? sequence[DESTINATION] - sequence[SOURCE] + position : position
        end
      end.min
    end

    def part2(input)
      maps_inputs = input.split("\n\n")
      seeds = maps_inputs.shift.split(' ').drop(1).map(&:to_i)
      maps = maps_inputs.each_with_object([]) do |map_input, result|
        result << map_input.split("\n").drop(1).map { |row| row.split(' ').map(&:to_i) }
      end
      input = seeds.each_slice(2).map { |start, range| [start, range] }
      next_input = []
      maps.each do |map|
        input.each do |start, range|
          if sequence = map.detect { |row| row[SOURCE] <= start && start < row[SOURCE] + row[COUNT] }
            # check if the entire sequence fits
            offset = start - sequence[SOURCE]
            if start + range <= offset + sequence[COUNT]
          else
            # no sequence found, so we need to create one
          end
        end
      end
    end
  end
end
