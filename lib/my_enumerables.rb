module Enumerable
  def my_all?(arg = nil, &block)
    found = 0
    self.my_each { |element| found += 1 if element } if !block_given? && arg.nil?
    self.my_each { |element| found += 1 if element == arg } if !block_given? && !arg.nil?
    self.my_each { |element| found += 1 if block.call(element) } if block_given? && arg.nil?
    found >= self.size
  end

  def my_any?(arg = nil, &block)
    found = 0
    self.my_each { |element| found += 1 if element } if !block_given? && arg.nil?
    self.my_each { |element| found += 1 if element == arg } if !block_given? && !arg.nil?
    self.my_each { |element| found += 1 if block.call(element) } if block_given? && arg.nil?
    found.positive? ? true : false
  end

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

  def my_none?(arg = nil, &block)
    without_target = self.size
    self.my_each { |element| without_target -= 1 if element } if !block_given? && arg.nil?
    self.my_each { |element| without_target -= 1 if element == arg } if !block_given? && !arg.nil?
    self.my_each { |element| without_target -= 1 if block.call(element) } if block_given? && arg.nil?
    without_target >= self.size
  end
end
