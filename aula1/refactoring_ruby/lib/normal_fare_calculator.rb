require 'fare_calculator'
class NormalFareCalculator < FareCalculator
  FARE = 2.1

  def calculate(segment:)
    segment.distance * FARE
  end
end
