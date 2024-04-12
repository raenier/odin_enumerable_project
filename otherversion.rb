module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0

    my_each do |item|
      yield item, index
      index += 1
    end
  end

  def my_select
    selected = []
    my_each do |item|
      selected << item if yield(item)
    end

    selected
  end

  def my_all?
    my_each do |item|
      return false unless yield(item)
    end

    true
  end

  def my_any?
    my_each do |item|
      return true if yield(item)
    end

    false
  end

  def my_none?
    my_each do |item|
      return false if yield(item)
    end

    true
  end

  def my_count
    return size unless block_given?

    count = 0
    my_each { |item| count += 1 if yield(item) }
    count
  end

  def my_map
    transformed_arr = []
    my_each do |item|
      transformed_arr << yield(item)
    end

    transformed_arr
  end

  def my_inject(init_value = 0)
    my_each do |item|
      init_value = yield(init_value, item)
    end

    init_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for item in self
      yield item
    end
  end
end
