require 'segment'
require 'date'

class Ride
  NORMAL_FARE = 2.1
  OVERNIGHT_FARE = 3.9
  SUNDAY_FARE = 2.9
  OVERNIGHT_SUNDAY_FARE = 5
  FIRST_DAY_FARE = 1.5
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
      if segment.special_day?
        fare += segment.distance * FIRST_DAY_FARE
        next
      end

      if segment.overnight? && !segment.sunday?
        fare += segment.distance * OVERNIGHT_FARE
        next
      end

      if segment.overnight? && segment.sunday?
        fare += segment.distance * OVERNIGHT_SUNDAY_FARE
        next
      end

      if !segment.overnight? && segment.sunday?
        fare += segment.distance * SUNDAY_FARE
        next
      end

      if !segment.overnight? && !segment.sunday?
        fare += segment.distance * NORMAL_FARE
        next
      end
    end
    fare < MIN_FARE ? MIN_FARE : fare
  end
end
