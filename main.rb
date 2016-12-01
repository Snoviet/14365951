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

  def coverage
    @distance = Math.sqrt(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1)))
  end

end

class BaseStation

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

  def initialize(x, y)
    @stationArr = []
    @counter = 0
    #@dimX = x.to_i
    #@dimY = y.to_i
    #@grid[@dimX, @dimY]
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

#def grid_size
#  puts "Size of Grid: #{@dimX * @dimY}"
#end

end


=begin
class Grid

  def initialize(x, y)
    @dimX = x
    @dimY = y
    @grid[x, y]
  end

  def size
    puts "Size of Grid: #{@dimX * @dimY}"
  end

end
=end

@mainReader = FileReader.new('base_stations.txt')
@mainReader.read_in
@stationList = @mainReader.allStations
@stationList.to_s