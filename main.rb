
@mainReader = FileInput.new('base_stations.txt')
@mainReader.read_in

class FileReader

  def initialize(filename)
    @fileName = filename
  end

  def read_in
    @counter = 0
    @BaseStation = []
    @Cell = []
    lines = File.readlines(@fileName)
    if !lines.empty?
      lines.each do |line|
        temparr = line.split
        @Cell[@counter] = (Cell.new(temparr[1], temparr[2])
        @BaseStation[@counter] = (BaseStation.new(temparr[0],@Cell[@counter]))
        @counter += 1
      end
    else
      @error = "Error: File Empty"
      puts @error
    end
  end

end

class Cell

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    puts "(#{@x},#{@y}"
  end

end


class BaseStation

  def initialize(name, cell)
    @name = name
    @cell = cell
  end

  def to_s

  end

end


class BaseStations

  def initialize
    @stationArr = []
    @counter = 0
  end

  def add_station(station)
    @stationArr[@counter] = station
    @counter = @counter + 1
  end

  def to_s
    puts
  end

end
