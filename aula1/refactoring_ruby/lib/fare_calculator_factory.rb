require 'normal_fare_calculator'
require 'sunday_fare_calculator'
require 'overnight_fare_calculator'
require 'overnight_sunday_fare_calculator'
require 'special_day_fare_calculator'

class FareCalculatorFactory
  def self.create(segment:)
    if segment.special_day?
      return SpecialDayFareCalculator.new
    end

    if segment.overnight? && !segment.sunday?
      return OvernightFareCalculator.new
    end

    if segment.overnight? && segment.sunday?
      return OvernightSundayFareCalculator.new
    end

    if !segment.overnight? && segment.sunday?
      return SundayFareCalculator.new
    end

    if !segment.overnight? && !segment.sunday?
      return NormalFareCalculator.new
    end

    raise StandardError
  end
end
