module Year2022
  class Day08
    def part1(input)
      grid = input.split.map(&:chars).map { |row| row.map(&:to_i) }
      visible = 0
      grid.each_with_index do |row, i|
        row.each_with_index do |col, j|
          visible += 1 if visible?(grid, i, j)
        end
      end
      visible
    end

    def part2(input)
      grid = input.split.map(&:chars).map { |row| row.map(&:to_i) }
      scenic_scores = []
      grid.each_with_index do |row, i|
        scenic_scores[i] = []
        row.each_with_index do |col, j|
          scenic_scores[i].push(calculate_scenic_score(grid, i, j))
        end
      end
      scenic_scores.reduce([]) { |res, arr| res.concat(arr) }.max
    end

    private

    def visible?(grid, i, j)
      tree_height = grid[i][j]
      return true if [0, grid.length - 1].include?(i) || [0, grid[0].length - 1].include?(j)
      return true unless (0...i).detect { |k| grid[k][j] >= tree_height }
      return true unless (i+1...grid.length).detect { |k| grid[k][j] >= tree_height }
      return true unless (0...j).detect { |k| grid[i][k] >= tree_height }
      return true unless (j+1...grid[0].length).detect { |k| grid[i][k] >= tree_height }
      false
    end

    def calculate_scenic_score(grid, i, j)
      tree_height = grid[i][j]
      return 0 if [0, grid.length - 1].include?(i) || [0, grid[0].length - 1].include?(j)
      left = (i - 1).downto(0).each_with_object({sum: 0}) { |k, sum| sum[:sum] += 1; break sum if grid[k][j] >= tree_height }[:sum]
      right = (i + 1...grid.length).each_with_object({sum: 0}) { |k, sum| sum[:sum] += 1; break sum if grid[k][j] >= tree_height }[:sum]
      up = (j - 1).downto(0).each_with_object({sum: 0}) { |k, sum| sum[:sum] += 1; break sum if grid[i][k] >= tree_height }[:sum]
      down = (j + 1...grid[0].length).each_with_object({sum: 0}) { |k, sum| sum[:sum] += 1; break sum if grid[i][k] >= tree_height }[:sum]
      [left, right, up, down].compact.reduce(:*)
    end
  end
end
