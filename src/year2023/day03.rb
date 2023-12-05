module Year2023
  class Day03
    SYMBOLS = /[^\d\.\n]/
    NUMBER = /\d+/

    def part1(input)
      sum = 0
      input.lines.each_with_index do |line, i|
        line.enum_for(:scan, /\d+/).map do |match|
          j = Regexp.last_match.begin(0)
          if (line[j-1] =~ SYMBOLS || line[j+match.length] =~ SYMBOLS) ||
             (i > 0 && input.lines[i-1][[j-1, 0].max..[j+match.length, line.length-1].min] =~ SYMBOLS) ||
             (i < input.lines.length-2 && input.lines[i+1][[j-1, 0].max..[j+match.length, line.length-1].min] =~ SYMBOLS)
            sum += match.to_i
          end
        end
      end
      sum
    end

    def part2(input)
      sum = 0
      input.lines.each_with_index do |line, i|
        line.enum_for(:scan, /\*/).map do |match|
          j = Regexp.last_match.begin(0)
          res = adjacent_numbers(i, j, input)
          sum += res.reduce(&:*) if res.length == 2
        end
      end
      sum
    end

    private

    def adjacent_numbers(i, j, input)
      (i-1..i+1).each.with_object([]) do |ii, results|
        next if ii < 0 or ii >= input.lines.length
        area = input.lines[ii][j-1..j+1]
        if area =~ /\d\d\d/
          results << parse_number_at(j, input.lines[ii])
        elsif area =~ /\d.\d/
          results << parse_number_at(j-1, input.lines[ii])
          results << parse_number_at(j+1, input.lines[ii])
        elsif pos = area.index(/\d/)
          results << parse_number_at(j-1+pos, input.lines[ii])
        end
      end
    end

    def parse_number_at(j, line)
      i = j
      while line[i] =~ /\d/ && i > 0 do
        i -= 1
      end
      line[i..].match(/\d+/)[0].to_i
    end
  end
end
