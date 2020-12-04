module Year2020
  class Day04
    def part1(input)
      passwords = parse_input(input)
      passwords.count { |p| (required_fields.keys - p.keys).empty? }
    end

    def part2(input)
      passwords = parse_input(input)
      passwords.count { |p| valid?(p) }
    end

    private

    def parse_input(input)
      input.chomp.split("\n\n").map do |i| 
        i.gsub("\n", ' ').split(' ').to_h do |j|
          j.split(':')
        end
      end
    end

    def required_fields
      @required_fields ||= {
        "byr" => /^(19[2-9][0-9]|200[0-2])$/,
        "iyr" => /^20(1[0-9]|20)$/,
        "eyr" => /^20(2[0-9]|30)$/,
        "hgt" => /^(1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in)$/,
        "hcl" => /^#[0-9a-f]{6}$/,
        "ecl" => /^(amb|blu|brn|gry|grn|hzl|oth)$/,
        "pid" => /^[0-9]{9}$/
      }
    end

    def valid?(passport)
      return false unless (required_fields.keys - passport.keys).empty?
      passport.each do |k, v|
        next unless required_fields.key?(k)
        return false if required_fields[k].match(v).nil?
      end
      true
    end
  end
end
