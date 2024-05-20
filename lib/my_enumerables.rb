module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    if self.is_a?(Array)
      for element in self do
        yield element
      end
    elsif self.is_a?(Hash)
      for key, value in self do
        yield key, value
      end
    end
  end
end
