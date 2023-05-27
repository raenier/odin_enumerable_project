module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
    return self
  end

  def my_select
    filtered = []
    self.my_each do |element|
      passed_filter = yield(element)
      filtered << element if passed_filter
    end
    return filtered
  end

  def my_all?
    results = []
    self.my_each do |element|
      results << yield(element)
    end
    results.uniq == [true]
  end

  def my_any?
    results = []
    self.my_each do |element|
      results << yield(element)
    end
    results.include? true
  end

  def my_none?
    results = []
    self.my_each do |element|
      results << yield(element)
    end
    !results.include? true
  end

  def my_count
    return self.count unless block_given?
    count = 0
    self.my_each do |element|
      count += 1 if yield(element)
    end
    return count
  end

  def my_map
    transformed_array = []
    self.my_each do |element|
      transformed_array << yield(element)
    end
    return transformed_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.length.times do |i|
      yield(self[i])
    end
    return self
  end
end
