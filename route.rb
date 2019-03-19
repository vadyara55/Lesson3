class Route # класс маршрут

  def initialize(from, to) # конструктор переменных from , to
    @stations = [from, to] # массив станций от и до
  end

  def add_station(station) # метод добавляет станции
    stations.insert(-2, station) # добавляется станция на значение индекса -2 в массиве
  end

  def remove_station(station) # удаляет станцию из маршрута
    return if [stations.first, station.last].include?(station) # проверяет является ли станция первой или последней станцией маршрута в данном массиве,если да, выводит
    stations.delete(station) # иначе удаляет эту станцию из массива
  end

  def show_stations # метод показывает станции
    stations.each{|station| puts " #{station.name}" } # перебирает станации входящие в массив и выводит их имена
  end
end
