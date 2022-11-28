require 'fare_calculator'
class OvernightSundayFareCalculator < FareCalculator
  FARE = 5

  def calculate(segment:)
    segment.distance * FARE
  end
end
