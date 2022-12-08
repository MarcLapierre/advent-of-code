module Year2022
  class Day07
    def part1(input)
      @sizes = []
      structure = parse_structure(input)
      calculate_size(structure["/"])
      @sizes.reject { |size| size > 100000 }.sum
    end

    def part2(input)
      @sizes = []
      structure = parse_structure(input)
      calculate_size(structure["/"])
      @sizes.reject { |size| size < 8381165 }.min
    end

    private

    def parse_structure(input)
      structure = {}
      pointer = []
      input.split('$').drop(1).each do |chunk|
        lines = chunk.strip.split("\n")
        command = lines.shift
        pieces = command.split
        case pieces[0]
        when 'cd'
          if pieces[1] == '..'
            pointer.pop
          else
            if pointer.any? && ref = structure.dig(*pointer)
              ref[pieces[1]] = {} unless ref[pieces[1]]
            else
              structure[pieces[1]] = {}
            end
            pointer.append(pieces[1])
          end
        when 'ls'
          ref = structure.dig(*pointer)
          lines.each do |line|
            next if line.start_with?('dir')
            size, name = line.strip.split
            ref[name] = size.to_i
          end
        end
      end
      structure
    end

    def calculate_size(folder_entries)
      size = 0
      folder_entries.each do |k, v|
        size += v.is_a?(Hash) ? calculate_size(v) : v
      end
      @sizes.push(size)
      size
    end
  end
end
