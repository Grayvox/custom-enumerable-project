module Enumerable
  def my_count(arg = nil, &block)
    count = 0
    return self.size if !block_given? && arg.nil?

    unless arg.nil?
      self.my_each { |element| count += 1 if element == arg }
      return count
    end
    self.my_each { |element| count += 1 if block.call(element) }
    count
  end

  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self do
      yield element
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for element in self do
      yield element, index
      index += 1
    end
  end
end
