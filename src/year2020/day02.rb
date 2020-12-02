module Year2020
  class Day02
    def part1(input)
      passwords = input.chomp.split("\n")
      passwords.map do |p|
        m = /(\d+)-(\d+) ([a-z]): ([A-z]+)/.match(p)
        min, max, letter, password = m[1..4]
        password.count(letter) >= min.to_i && password.count(letter) <= max.to_i
      end.count(true)
    end

    def part2(input)
      passwords = input.chomp.split("\n")
      passwords.map do |p|
        m = /(\d+)-(\d+) ([a-z]): ([A-z]+)/.match(p)
        p1, p2, letter, password = m[1..4]
        (password[p1.to_i-1] == letter) ^ (password[p2.to_i-1] == letter)
      end.count(true)
    end
  end
end
