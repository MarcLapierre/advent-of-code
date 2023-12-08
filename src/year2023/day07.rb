module Year2023
  class Day07
    CARDS = '23456789TJQKA'.freeze
    def part1(input)
      hands = input.split("\n").map { |line| line.split(' ') }
      hands.sort! do |a, b|
        res = calculate_winner(a, b)
        return 0 if res.nil?
        res == a ? 1 : -1
      end
      hands.each_with_index.map do |hand, i|
        hand[1].to_i * (i + 1)
      end.sum
    end

    def part2(input)
      nil
    end

    private

    def card_counts(hand)
      hand.chars.each_with_object({}) { |card, obj| obj[card] ? obj[card] += 1 : obj[card] = 1 }
    end

    def calculate_winner(a, b)
      a_counts = a[0].chars.tally.values
      b_counts = b[0].chars.tally.values

      return a if a_counts.max >= 4 && a_counts.max > b_counts.max
      return b if b_counts.max >= 4 && b_counts.max > a_counts.max
      return a if a_counts.max == 3 && a_counts.min == 2 && b_counts.max != 3 && b_counts.min != 2
      return b if b_counts.max == 3 && b_counts.min == 2 && a_counts.max != 3 && a_counts.min != 2
      return a if a_counts.max == 3 && b_counts.max != 3
      return b if b_counts.max == 3 && a_counts.max != 3
      return a if a_counts.count(2) == 2 && b_counts.count(2) != 2
      return b if b_counts.count(2) == 2 && a_counts.count(2) != 2
      return a if a_counts.count(2) == 1 && b_counts.count(2) != 1
      return b if b_counts.count(2) == 1 && a_counts.count(2) != 1

      5.times do |i|
        next if a[0].chars[i] == b[0].chars[i]
        return CARDS.index(a[0].chars[i]) > CARDS.index(b[0].chars[i]) ? a : b
      end
      nil
    end
  end
end
