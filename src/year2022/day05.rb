module Year2022
  class Day05
    def part1(input)
      perform(input, grab_multiple: false)
    end

    def part2(input)
      perform(input, grab_multiple: true)
    end

    private

    def perform(input, grab_multiple:)
      drawing, instructions = input.split("\n\n").map { |i| i.split("\n") }
      stacks = parse_drawing(drawing)
      process_instructions(instructions, stacks, grab_multiple: grab_multiple)
    end

    def parse_drawing(drawing)
      stacks = Array.new(drawing.pop.split.count) { Array.new }
      drawing.reverse_each do |row|
        "  #{row}".chars.each_slice(4).with_index do |c, i|
          stacks[i].push(c[3]) if c[3] && !c[3].strip.empty?
        end
      end
      stacks
    end

    def process_instructions(instructions, stacks, grab_multiple:)
      instructions.each do |i|
        _, qty, _, from, _, to = i.split.map(&:to_i)
        removed = stacks[from-1].pop(qty)
        removed.reverse! unless grab_multiple
        stacks[to-1].append(*removed)
      end
      stacks.map(&:last).join
    end
  end
end
