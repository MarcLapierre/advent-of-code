module Year2019
  class Day01
    def part1(input)
      masses = parse_input(input)
      masses.reduce(0) { |sum, m| sum + (m / 3.0).floor - 2 }
    end

    def part2(input)
      masses = parse_input(input)
      masses.reduce(0) { |sum, m| sum + fuel_for_mass(m) }
    end

    private

    def parse_input(input)
      input.chomp.split.map(&:to_i)
    end

    def fuel_for_mass(mass)
      fuel = [((mass / 3.0).floor - 2), 0].max
      fuel += fuel_for_mass(fuel) if fuel > 0
      fuel
    end
  end
end
