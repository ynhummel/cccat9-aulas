require 'fare_calculator_handler'

class OvernightSundayFareCalculatorHandler < FareCalculatorHandler
  FARE = 5

  def calculate(segment:)
    if segment.overnight? && segment.sunday?
      return segment.distance * FARE
    end
    raise StandardError if @next_handler.nil?

    @next_handler.calculate(segment: segment)
  end
end
