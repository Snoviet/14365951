class FileReader
  attr_accessor :allStations

  def initialize(filename)
    @fileName = filename
    @allStations = BaseStations.new(21, 21)
  end

  def read_in
    @counter = 0
    @BaseStation = []
    @Cell = []
    lines = File.readlines(@fileName)
    if !lines.empty?
      lines.each do |line|
        temparr = line.split
        @Cell[@counter] = (Cell.new(temparr[1], temparr[2]))
        @BaseStation[@counter] = (BaseStation.new(temparr[0],@Cell[@counter]))
        @allStations.add_station(@BaseStation[@counter])
        @counter += 1
      end
        else
        puts 'Error: File Empty'
    end
  end

end

class Cell

  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    print "(#{@x},#{@y}) "
  end

  def coverage(stations)
    @tempX1 = @x
    @tempX2 =
    @tempY1 = @y
    @tempY2 = 0
    if @tempX2 < @tempX1
      @tempX1, @tempX2= @tempX2, @tempX1
    end
    if @tempy2 < @tempY1
      @tempY1, @tempY2= @tempY2, @tempY1
    end

    @distance = Math.sqrt(((@tempX2-@tempX1)*(@tempX2-@tempX1))+((@tempY2-@tempY1)*(@tempY2-@tempY1)))

    while
    @distance = Math.sqrt(((@tempX2-@tempX1)*(@tempX2-@tempX1))+((@tempY2-@tempY1)*(@tempY2-@tempY1)))
      if @lowest > @distance
        @lowest = @distance
      end
    end
    @coverage = (1/1+@lowest)
  end

end

class BaseStation
  attr_accessor :cell

  def initialize(name, cell)
    @name = name
    @cell = cell
  end

  def to_s
    print "#{@name} "
    print @cell.to_s
  end

end


class BaseStations
  attr_accessor :stationArr

  def initialize(x, y)
    @stationArr = []
    @counter = 0
  end

  def add_station(station)
    @stationArr[@counter] = station
    @counter = @counter + 1
    @i = 0
  end

  def to_s
    puts "Here are the base stations:"
    while @i < (@counter+1)
      print @stationArr[@i].to_s
      @i = @i + 1
    end
  end

end

class Grid

  def initialize(x, y)
    @dimX = x
    @dimY = y
  end

  def grid_dimensions
    puts "Dimensions of Grid: (#{@dimX}, #{@dimY})"
  end

  def grid_size
    puts "Size of Grid: #{@dimX * @dimY}"
  end

end

@mainReader = FileReader.new('base_stations.txt')
@mainReader.read_in
puts
@mainGrid = Grid.new(21, 21)
@mainGrid.grid_dimensions
@mainGrid.grid_size
puts
@stationList = @mainReader.allStations
@stationList.to_s
puts

@testLocation = Cell.new(3,5)
@testLocation.coverage(@stationList.stationArr)