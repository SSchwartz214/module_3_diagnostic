class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :distance,
              :access_time

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @fuel_type = data[:fuel_type]
    @distance = data[:distance]
    @access_time = data[:access_time]
  end

  def self.find_all(zip)
    NrelService.find_stations(zip).map do |raw_station|
      new(raw_station)
    end
  end
end
