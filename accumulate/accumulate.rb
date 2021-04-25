# frozen_string_literal: true

class Array
  def accumulate
    if empty?
      self
    else
      map do |elem|
        yield(elem)
      end
    end
  end
end
