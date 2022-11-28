require 'fare_calculator_handler'

class SundayFareCalculatorHandler < FareCalculatorHandler
  FARE = 2.9

  def calculate(segment:)
    if !segment.overnight? && segment.sunday?
      return segment.distance * FARE
    end
    raise StandardError if @next_handler.nil?

    @next_handler.calculate(segment: segment)
  end
end
