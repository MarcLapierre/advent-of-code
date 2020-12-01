module Year2020
  class Day01
    TARGET = 2020

    def part1(input)
      # O(n/2)
      entries = setup_input(input)
      factor1 = entries.detect { |entry| entries.include?(TARGET - entry) }
      factor1 * (TARGET - factor1)
    end

    def part2(input)
      # O(n^2/4)
      entries = setup_input(input)
      removed_entries = []
      entries.each do |factor1|
        removed_entries << factor1
        new_target = TARGET - factor1
        new_entries = Set.new(entries - removed_entries)
        next unless factor2 = new_entries.detect { |entry| new_entries.include?(new_target - entry) }
        return factor1 * factor2 * (new_target - factor2)
      end 
    end

    private

    def setup_input(input)
      Set.new(input.chomp.split.map(&:to_i))
    end
  end
end
