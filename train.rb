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
    route.stations[@current_station - 1]
  end

  def go_to_next_station
    route.stations[@current_station + 1].get_train(self)
  end

  def go_to_prev_station
    route.stations[@current_station - 1].get_train(self)
  end

  def go_to(station) # задаем станцию для прибытия
    if route.nil? # проверяем задан ли маршрут, пуст ли он.
      puts "Без маршрута поезд заблудится."
    elsif @station == station # проверяем стоит ли поезд уже на этой станции
      puts "Поезд №#{number} и так на станции #{@station.name}"
    elsif route.stations.include?(station) # проверка станции в маршруте , но точно не понял
      @station.send_train(self) if @station # Обращается к методу в другом классе ,чтоб добавить станцию в массив
      @station = station # ТАК ПОНЯЛ ПРИСВАИВАЕМ К ИНСТАНС ПЕРЕМЕННОЙ
      station.get_train(self) #  обращается к методу класса station
    else
      puts "Станция #{station.name} не входит в маршрут №#{number}"
    end
  end

  def stations_around # метод для вывода станциий
    if route.nil? # проверяем задан ли маршрут
      puts "Маршрут не задан"
    else
      station_index = route.stations.index(station) # переменная равна индексу станции в массиве(маршруте)
      puts "Сейчас поезд на станции #{station.name}."
      puts "Предыдущая станция - #{route.station[station_index - 1].name}." if station_index != 0 # если индекс не равен 0, то выведется
      puts "Следущая  - #{route.stations[stations_index + 1].name}." if station_index != route.stations.size - 1 # если не равно индексу предыдущей станции ,то выведется
    end
  end
end
