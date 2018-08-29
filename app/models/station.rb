class Station

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @fuel_type = data[:fuel_type]
    @distance = data[:distance]
    @access_type = data[:access_type]
  end
end
