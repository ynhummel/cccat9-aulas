require 'ride'

describe Ride do
  it 'Deve calcular uma corrida no primeiro dia do mês' do
    ride = Ride.new
    ride.add_segment(distance: 10, date_time: DateTime.new(2021, 3, 1,10, 0, 0))
    expect(ride.calculate_fare).to eq(15)
  end

  it 'Deve calcular uma corrida normal' do
    ride = Ride.new
    ride.add_segment(distance: 10, date_time: DateTime.new(2021, 3, 2,10, 0, 0))
    expect(ride.calculate_fare).to eq(21)
  end

  it 'Deve calcular uma corrida noturna' do
    ride = Ride.new
    ride.add_segment(distance: 10, date_time: DateTime.new(2021, 3, 2, 23, 0, 0))
    expect(ride.calculate_fare).to eq(39)
  end
end
