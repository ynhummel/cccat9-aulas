require 'ride'
require 'normal_fare_calculator_handler'
require 'special_day_fare_calculator_handler'
require 'sunday_fare_calculator_handler'
require 'overnight_sunday_fare_calculator_handler'
require 'overnight_fare_calculator_handler'

describe Ride do
  before(:each) do
    normal_fare_calculator = NormalFareCalculatorHandler.new
    sunday_fare_calculator = SundayFareCalculatorHandler.new(next_handler: normal_fare_calculator)
    overnight_fare_calculator = OvernightFareCalculatorHandler.new(next_handler: sunday_fare_calculator)
    overnight_sunday_fare_calculator = OvernightSundayFareCalculatorHandler.new(next_handler: overnight_fare_calculator)
    special_day_fare_calculator = SpecialDayFareCalculatorHandler.new(next_handler: overnight_sunday_fare_calculator)
    @ride = Ride.new(fare_calculator_handler: special_day_fare_calculator)
  end

  it 'Deve calcular uma corrida no primeiro dia do mês' do
    @ride.add_segment(distance: 10, date_time: DateTime.new(2021, 3, 1, 10, 0, 0))
    expect(@ride.calculate_fare).to eq(15)
  end

  it 'Deve calcular uma corrida normal' do
    @ride.add_segment(distance: 10, date_time: DateTime.new(2021, 3, 2, 10, 0, 0))
    expect(@ride.calculate_fare).to eq(21)
  end

  it 'Deve calcular uma corrida noturna' do
    @ride.add_segment(distance: 10, date_time: DateTime.new(2021, 3, 2, 23, 0, 0))
    expect(@ride.calculate_fare).to eq(39)
  end
end
