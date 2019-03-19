class Station  # класс станция

  def initialize(name) # конструктор для name
    @name = name # name присваивается инстанс переменной @name
    @trains = [] # пустой массив поездов
  end

  def get_train(train) #  метод принимает значение поезда
    trains << train #  добавляет в массив
  end

  def send_train(train) # метод отправления поезда со станции
    trains.delete(train) # удаляет поезд из массива
  end

  def trains_by_type(type)# метод задает тип поезда, прибывшего на станцию
      trains.select { |train| train.type == type}
  end
end
