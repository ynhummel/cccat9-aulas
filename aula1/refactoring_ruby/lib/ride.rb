require 'segment'
require 'date'
require 'fare_calculator_factory'

class Ride
  MIN_FARE = 10

  def initialize
    @segments = []
  end

  def add_segment(distance:, date_time:)
    @segments.push(Segment.new(distance: distance, date_time: date_time))
  end

  def calculate_fare
    fare = 0
    @segments.each do |segment|
      fare_calculator = FareCalculatorFactory.create(segment: segment)
      fare += fare_calculator.calculate(segment: segment)
    end
    fare < MIN_FARE ? MIN_FARE : fare
  end
end
