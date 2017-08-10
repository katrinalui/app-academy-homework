fish = [
  'fish', 'fiiish', 'fiiiiish', 'fiiiish',
  'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh'
]

# Find the longest fish in O(n^2) time
def sluggish_octopus(fishes)
  fishes.length.times do |i|
    longest_fish = fishes[i]

    fishes.length.times do |j|
      next if i == j
      longest_fish = nil if fishes[j].length > fishes[i].length
    end

    return longest_fish if longest_fish
  end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if length <= 1

    mid_idx = length / 2
    left = self.take(mid_idx).merge_sort(&prc)
    right = self.drop(mid_idx).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end
end

# Find the longest fish in O(n log n) time
def dominant_octopus(fishes)
  prc = Proc.new { |x, y| x.length <=> y.length }
  fishes.merge_sort(&prc).last
end

# Find the longest fish in O(n) time
def clever_octopus(fishes)
  longest_fish = fishes[0]

  fishes.each do |fish|
    longest_fish = fish if fish.length > longest_fish.length
  end

  longest_fish
end

# Given a tile direction, iterate through a tiles array to return the tentacle
# number (tile index) the octopus must move. This should take O(n) time.
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index { |tile, i| return i if tile == dir }
end

# Now that the octopus is warmed up, let's help her dance faster. Use a
# different data structure and write a new function so that you can access
# the tentacle number in O(1) time.
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def constant_dance(dir, tiles_hash)
  tiles_hash[dir]
end
