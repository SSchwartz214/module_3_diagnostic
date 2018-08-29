class Station

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @fuel_type = data[:fuel_type]
    @distance = data[:distance]
    @access_type = data[:access_type]
  end

  def self.find_all(zip)
    NrelService.find_stations(zip).map do |raw_station|
      new(raw_station)
    end
  end
end
