module Year2019
  class Day03
    def part1(input)
      wires = parse_input(input)
      wire_maps = create_wire_maps(wires)
      intersections = find_intersections(wire_maps)
      find_shortest_intersection(intersections)
    end
    

    def part2(input)
      nil
    end

    private

    def parse_input(input)
      input.chomp.split("\n").map { |w| w.split(',') }
    end

    def create_wire_maps(wires)
      wires.map do |wire|
        points = [[0,0]]
        wire.each do |segment|
          direction, length = /([A-Z])(\d+)/.match(segment)[1..2]
          points << case direction
          when 'D'
            [points.last[0], points.last[1] - length.to_i]
          when 'U'
            [points.last[0], points.last[1] + length.to_i]
          when 'L'
            [points.last[0] - length.to_i, points.last[1]]
          when 'R'
            [points.last[0] + length.to_i, points.last[1]]
          end
        end            
        points   
      end
    end
    
    def find_intersections(wire_maps)
      w1, w2 = wire_maps[0], wire_maps[1]
      intersections = []

      for i in 1...w1.length
        for j in 1...w2.length
          if intersection = find_intersection(w1[i-1], w1[i], w2[j-1], w2[j])
            intersections << intersection
          end
        end
      end
      intersections
    end

    def find_intersection(w1p1, w1p2, w2p1, w2p2)
      # returns if lines are parallel
      return if w1p1[0] == w1p2[0] && w2p1[0] == w2p2[0]
      return if w1p1[1] == w1p2[1] && w2p1[1] == w2p2[1]

      if w1p1[0] == w1p2[0]
        #line 1 is vertical
        if w2p1[0] >= w1p1[0] && w2p2[0] <= w1p1[0]
          #intersection
          return [w1p1[0], w2p1[1]]
        end
      else
        #line 1 is horizontal
        if w2p1[1] >= w1p1[1] && w2p2[1] <= w1p1[1]
          #intersection
          return [w2p1[0], w1p1[1]]
        end
      end
    end

    def find_shortest_intersection(intersections)
      lengths = intersections.map { |i| i[0].abs + i[1].abs }
      lengths.min
    end
  end
end
