require 'fare_calculator_handler'

class SpecialDayFareCalculatorHandler < FareCalculatorHandler
  FARE = 1.5

  def calculate(segment:)
    if segment.special_day?
      return segment.distance * FARE
    end
    raise StandardError if @next_handler.nil?

    @next_handler.calculate(segment: segment)
  end
end
