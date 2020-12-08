module Year2020
  class Day08
    def part1(input)
      instructions = parse_input(input)
      accumulator = 0
      index = 0
      visited = Set.new

      loop do
        break if visited.include?(index)
        visited.add(index)

        case instructions[index][:instruction]
        when 'acc'
          accumulator += instructions[index][:value]
          index += 1
        when 'jmp'
          index += instructions[index][:value]
        when 'nop'
          index += 1
        else
          raise "error: unknown instruction: #{instructions[index][:instruction]}"
        end
      end
      accumulator
    end

    def part2(input)
      instructions = parse_input(input)
      index = 0
      
      loop do
        return unless index = find_next_changeable_instruction(index, instructions)
        new_instructions = swap_instruction_at(index, instructions)
        if result = solvable?(new_instructions)
          return result
        end
      end
    end

    private

    def parse_input(input)
      input.chomp.split("\n").map do |i| 
        j, k = i.split; 
        { instruction: j, value: k.to_i }
      end
    end

    def find_next_changeable_instruction(offset, instructions)
      return unless index = instructions.drop(offset + 1).map(&:clone).find_index do |i|
        i[:instruction] == 'nop' || i[:instruction] == 'jmp'
      end
      index + offset + 1
    end

    def swap_instruction_at(index, instructions)
      new_instructions = instructions.map(&:clone)
      new_instructions[index][:instruction] = new_instructions[index][:instruction] == 'nop' ? 'jmp' : 'nop'
      new_instructions
    end

    def solvable?(instructions)
      accumulator = 0
      index = 0
      visited = Set.new

      loop do
        return nil if visited.include?(index)
        return accumulator if index == instructions.length
        visited.add(index)

        case instructions[index][:instruction]
        when 'acc'
          accumulator += instructions[index][:value]
          index += 1
        when 'jmp'
          index += instructions[index][:value]
        when 'nop'
          index += 1
        else
          raise "error: unknown instruction: #{instructions[index][:instruction]}"
        end
      end
      accumulator
    end
  end
end
