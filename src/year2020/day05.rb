module Year2020
  class Day05
    def part1(input)
      input.chomp.split("\n").map do |p|
        row, seat = p.gsub(/[FL]/, '0').gsub(/[BR]/, '1')[/.{7}/], $'
        row.to_i(2) * 8 + seat.to_i(2)
      end.max
    end

    def part2(input)
      seats = input.chomp.split("\n").map do |p|
        row, seat = p.gsub(/[FL]/, '0').gsub(/[BR]/, '1')[/.{7}/], $'
        row.to_i(2) * 8 + seat.to_i(2)
      end.sort

      (seats[0]..seats[-1]).to_a - seats
    end
  end
end
