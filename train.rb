class Train # класс поезд
  attr_accessor :station
  attr_reader :speed, :number, :car_count, :route, :type
  def initialize(number, type, car_count) # конструктор
    @number = number # присвоение переменной к @инстанс переменной. Которую видно во всем классе.
    @type = type # тип поезда
    @car_count = car_count # количество вагонов
    @speed = 0 # скорость поезда
  end

  def stop # метод остановки поезда
    self.speed = 0 # self в данном случае вызывает сеттер
  end

  def add_car # метод прибавляет вагоны
    return unless speed.zero? # выполняем пока скорость не будет 0. Используем zero, т.к. может быть число с плавающей точкой
    @car_count += 1 # прибавляет один поезд
  end

  def remove_car # метод удаляет поезд из массива
    return unless speed.zero?
    return unless car_count.positive?
    @car_count -= 1
  end

  def take_route(route) # метод задает маршрут поезду
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
    current_station.get_train(self)
    next_station.get_train(self)
    @current_station += 1
  end

  def go_to_prev_station
    current_station.get_train(self)
    prev_station.get_train(self)
    @current_station -= 1
  end
end
