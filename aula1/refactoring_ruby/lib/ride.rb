require 'segment'
require 'date'

class Ride
  MIN_FARE = 10

  attr_reader :fare_calculator_handler

  def initialize(fare_calculator_handler:)
    @segments = []
    @fare_calculator_handler = fare_calculator_handler
  end

  def add_segment(distance:, date_time:)
    @segments.push(Segment.new(distance: distance, date_time: date_time))
  end

  def calculate_fare
    fare = 0
    @segments.each do |segment|
      fare += @fare_calculator_handler.calculate(segment: segment)
    end
    fare < MIN_FARE ? MIN_FARE : fare
  end
end
