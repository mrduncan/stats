module Stats
  class TimingStat < Array
    # Returns the average value.
    def avg
      return nil if length == 0
      sum / length.to_f
    end

    # Returns the population variance of the values.
    def pop_var
      return nil if length == 0
      average = avg
      1 / length.to_f * inject(0) { |acc, i| acc + (i - average) ** 2 }
    end

    # Returns the standard deviation of the values.
    def std_dev
      return nil if length == 0
      Math.sqrt(pop_var)
    end

    private
      # Returns the sum of all values.
      def sum
        inject(0) { |acc, i| acc + i }
      end
  end
end
