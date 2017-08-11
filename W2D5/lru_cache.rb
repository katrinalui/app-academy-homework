class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)
      @cache.delete(el)
    elsif count >= @size
      @cache.shift
    end

    @cache << el
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache.dup
  end
end
