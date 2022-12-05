module Year2022
  class Day04
    def part1(input)
      input.split.map do |line|
        nums = line.split(/[-,]/).map(&:to_i)
        s1 = (nums[0]..nums[1]).to_a
        s2 = (nums[2]..nums[3]).to_a
        [s1, s2].any?(s1.intersection(s2)) ? 1 : 0
      end.sum
    end

    def part2(input)
      input.split.map do |line|
        nums = line.split(/[-,]/).map(&:to_i)
        s1 = (nums[0]..nums[1]).to_a
        s2 = (nums[2]..nums[3]).to_a
        s1.intersection(s2).any? ? 1 : 0
      end.sum
    end
  end
end
