class MaxIntSet

  attr_reader :max , :store

  def initialize(max) # 4
    @store = Array.new(max)
    @max = max
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true 
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    if is_valid?(num)
      @store[num]
    end
  end

  private

  def is_valid?(num)
    if num > @max || num < 0 
      false 
      raise "Out of bounds"
    else
        true
    end    
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
   
    bucket = num % 20
    # @store[bucket] << num 
    @store[bucket] = num
  end

  def remove(num)
    @store.delete(num)
    
  end

  def include?(num)
    @store.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :num_buckets

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    # @num_buckets = num_buckets
    @bucket = num_buckets
  end

  def insert(num)
    unless include?(num)
      if self[num].empty?
        self[num] << num 
        @count += 1
      else
        resize! # Increase bucket size && move element into right bucket
      end
  end
  end

  def remove(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @bucket]
  end

  def num_buckets
    @store.length
  end

  def resize!
    # if @store[bucket].nil? 
    # Y: Let it be
    # N: resize > num_bucket * 2
    # add the new_num_buckets to 

    # call on insert
  end
end
