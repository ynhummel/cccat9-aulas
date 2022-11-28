class FareCalculatorHandler
  def initialize(next_handler: nil)
    @next_handler = next_handler
  end

  def calculate() end
end
