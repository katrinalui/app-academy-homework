class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_idx = @map.index { |pair| pair[0] == key }
    pair_idx ? @map[pair_idx][1] = value : @map << [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] == key }
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    deep_dup(@map)
  end

  private

  def deep_dup(array)
    array.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  end
end
