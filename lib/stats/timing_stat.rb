module Stats
  class TimingStat < Array
    # Returns the average value.
    def average
      sum / length.to_f
    end

    # Returns the population variance of the values.
    def population_variance
      avg = average
      1 / length.to_f * inject(0) { |acc, i| acc + (i - avg) ** 2 }
    end

    # Returns the standard deviation of the values.
    def standard_deviation
      Math.sqrt(population_variance)
    end

    private
      # Returns the sum of all values.
      def sum
        inject(0) { |acc, i| acc + i }
      end
  end
end
