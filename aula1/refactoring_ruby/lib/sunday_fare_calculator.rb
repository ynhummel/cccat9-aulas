require 'fare_calculator'
class SundayFareCalculator < FareCalculator
  FARE = 2.9

  def calculate(segment:)
    segment.distance * FARE
  end
end
