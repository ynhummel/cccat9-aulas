require 'fare_calculator'
class SpecialDayFareCalculator < FareCalculator
  FARE = 1.5

  def calculate(segment:)
    segment.distance * FARE
  end
end
