module Year2020
  class Day07
    TARGET = 'shiny gold'

    def part1(input)
      bags = parse_input1(input)
      targets = [TARGET]
      loop do
        results = find_bags_containing(targets, bags)
        break if results.count == targets.count
        targets = (targets + results).uniq
      end
      targets.count
    end

    def part2(input)
      bags = parse_input2(input)
      count_bags_for(TARGET, bags)
    end

    private

    def parse_input1(input)
      input.chomp.split("\n").map do |bag|
        if bag.index('no other bags')
          color = /^(.+) bags contain/.match(bag)[1]
          [color, []]
        else
          matches = /^(.+) bags contain( \d+ (.+)[,\.])+$/.match(bag)
          color = matches[1]
          contents = matches[2].split(',').map { |x| / ([a-z ]+) bags?/.match(x)[1] }
          [color, contents]
        end
      end.to_h
    end

    def parse_input2(input)
      input.chomp.split("\n").map do |bag|
        if bag.index('no other bags')
          color = /^(.+) bags contain/.match(bag)[1]
          [color, []]
        else
          matches = /^(.+) bags contain( \d+ (.+)[,\.])+$/.match(bag)
          color = matches[1]
          contents = matches[2].split(',').map do |x| 
            matches = / (\d+) ([a-z ]+) bags?/.match(x) 
            Array(matches[2]) * matches[1].to_i
          end.reduce(:+)
          [color, contents]
        end
      end.to_h
    end

    def find_bags_containing(targets, bags)
      bags.select do |key, values|
        (targets & values).any? if values
      end.keys
    end

    def count_bags_for(color, bags)
      # this should be optimized with memoization in a real app but...
      bags[color].count + bags[color].map { |c| count_bags_for(c, bags) }.sum
    end
  end
end
