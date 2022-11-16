class Segment
  SPECIAL_DAY_FARE = 1
  OVERNIGHT_START = 22
  OVERNIGHT_END = 6

  attr_reader :distance, :date_time

  def initialize(distance:, date_time:)
    @distance = initialize_distance(distance)
    @date_time = initialize_date_time(date_time)
  end

  def overnight?
    @date_time.hour >= OVERNIGHT_START || @date_time.hour <= OVERNIGHT_END
  end

  def sunday?
    @date_time.sunday?
  end

  def special_day?
    @date_time.day == SPECIAL_DAY_FARE
  end

  private

  def initialize_distance(distance)
    return distance if valid_distance?(distance)

    raise StandardError, 'Invalid distance'
  end

  def initialize_date_time(date_time)
    return date_time if valid_date_time?(date_time)

    raise StandardError, 'Invalid date or time'
  end

  def valid_distance?(distance)
    !distance.nil? && distance.is_a?(Numeric) && distance.positive?
  end

  def valid_date_time?(date_time)
    !date_time.nil? && date_time.instance_of?(DateTime)
  end
end
