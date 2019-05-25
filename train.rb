class Train

  attr_reader :number, :car_count, :route, :type

  def initialize(number, type, car_count)
    @number = number
    @type = type
    @car_count = car_count
    @speed = 0
  end

  def stop
    self.speed = 0
  end

  def increase_speed(speed)
    @speed += speed
    @speed = 0 if speed < 0
  end

  def current_speed
    @speed
  end

  def add_car
    return unless speed.zero?
    @car_count += 1
  end

  def remove_car
    return unless speed.zero?
    return unless car_count.positive?
    @car_count -= 1
  end

  def take_route(route)
    @route = route
    @current_station = 0
    current_station.get_train(self)
  end

  def current_station
    route.stations[@current_station]
  end

  def next_station
    route.stations[@current_station + 1]
  end

  def prev_station
    return unless @current_station > 0
    route.stations[@current_station - 1]
  end

  def go_to_next_station
    return if next_station.nil?
    current_station.send_train(self)
    next_station.get_train(self)
    @current_station += 1
  end

  def go_to_previous_station
    return if prev_station.nil?
    current_station.send_train(self)
    prev_station.get_train(self)
    @current_station -= 1
  end
end
