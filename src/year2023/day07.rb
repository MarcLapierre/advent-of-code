module Year2023
  class Day07
    CARDS = '23456789TJQKA'.freeze
    CARDS_J = 'J23456789TQKA'.freeze
    HAND_TYPES = %i[high_card one_pair two_pair three_of_a_kind full_house four_of_a_kind five_of_a_kind].freeze

    def part1(input)
      calculate_points(input, use_jokers: false)
    end

    def part2(input)
      calculate_points(input, use_jokers: true)
    end

    private

    def calculate_points(input, use_jokers:)
      hands = input.split("\n").map { |line| line.split(' ') }
      hands.sort! do |a, b|
        winner = winning_hand(a, b, use_jokers: use_jokers)
        return 0 if winner.nil?
        winner == a ? 1 : -1
      end
      hands.each_with_index.map do |hand, i|
        hand[1].to_i * (i + 1)
      end.sum
    end

    def winning_hand(a, b, use_jokers:)
      hand_type_a = hand_type(a[0], use_jokers: use_jokers)
      hand_type_b = hand_type(b[0], use_jokers: use_jokers)
      if hand_type_a != hand_type_b
        return HAND_TYPES.index(hand_type_a) > HAND_TYPES.index(hand_type_b) ? a : b
      else
        card_ranking = use_jokers ? CARDS_J : CARDS
        5.times do |i|
          next if a[0].chars[i] == b[0].chars[i]
          return card_ranking.index(a[0].chars[i]) > card_ranking.index(b[0].chars[i]) ? a : b
        end
      end
      nil
    end

    def hand_type(hand, use_jokers:)
      cards = hand.chars.tally
      jokers = use_jokers && cards.key?('J') ? cards.delete('J') : 0
      counts = cards.values
      return :five_of_a_kind if jokers == 5 || counts.max + jokers == 5
      return :four_of_a_kind if counts.max + jokers == 4
      return :full_house if counts.max + jokers == 3 && counts.min == 2
      return :three_of_a_kind if counts.max + jokers == 3
      return :two_pair if counts.count(2) == 2 || counts.count(2) == 1 && jokers == 1
      return :one_pair if counts.count(2) == 1 || jokers == 1
      :high_card
    end
  end
end
