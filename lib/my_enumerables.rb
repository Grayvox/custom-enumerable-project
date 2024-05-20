module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    if is_a?(Array)
      for element in self do
        yield element
      end
    elsif is_a?(Hash)
      for key, value in self do
        yield key, value
      end
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
