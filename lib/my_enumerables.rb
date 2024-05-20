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

    for key, value in self do
      yield key, value
    end
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    if is_a?(Array)
      index = 0
      for element in self do
        yield element, index
        index += 1
      end
    elsif is_a?(Hash)
      for key, value in self do
        yield key, value
      end
    end
  end
end
