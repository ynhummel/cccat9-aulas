require 'fare_calculator_handler'

class NormalFareCalculatorHandler < FareCalculatorHandler
  FARE = 2.1

  def calculate(segment:)
    if !segment.overnight? && !segment.sunday?
      return segment.distance * FARE
    end
    raise StandardError if @next_handler.nil?

    @next_handler.calculate(segment: segment)
  end
end
