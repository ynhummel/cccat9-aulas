require 'fare_calculator'
class OvernightFareCalculator < FareCalculator
  FARE = 3.9

  def calculate(segment:)
    segment.distance * FARE
  end
end
