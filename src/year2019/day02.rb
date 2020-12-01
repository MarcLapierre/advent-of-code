module Year2019
  class Day02
    def part1(input)
      input_array = parse_input(input)
      unless defined?(RSpec)
        input_array[1] = 12
        input_array[2] = 2
      end

      cursor = 0

      while input_array[cursor] != 99
        result = if input_array[cursor] == 1
          input_array[input_array[cursor + 1]] + input_array[input_array[cursor + 2]]
        elsif input_array[cursor] == 2
          input_array[input_array[cursor + 1]] * input_array[input_array[cursor + 2]]
        else
          raise "unknown opcode: #{input_array[cursor]}"
        end
        input_array[input_array[cursor + 3]] = result
        cursor += 4
      end

      input_array[0]
    end

    def part2(input)
      target = defined?(RSpec) ? 0 : 19690720

      for i in 0..99
        for j in 0..99
          begin
            input_array = parse_input(input)
            input_array[1] = i
            input_array[2] = j
            cursor = 0

            while input_array[cursor] != 99
              result = if input_array[cursor] == 1
                input_array[input_array[cursor + 1]] + input_array[input_array[cursor + 2]]
              elsif input_array[cursor] == 2
                input_array[input_array[cursor + 1]] * input_array[input_array[cursor + 2]]
              else
                raise "unknown opcode: #{input_array[cursor]}"
              end
              input_array[input_array[cursor + 3]] = result
              cursor += 4
            end

            return i * 100 + j if input_array[0] == target
          rescue
            # keep going
          end
        end
      end
    end

    private

    def parse_input(input)
      input.chomp.split(',').map(&:to_i)
    end
  end
end
