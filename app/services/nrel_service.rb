class NrelService
  def initialize(station)
    @station = station
    @conn = Faraday.new(url: "https://api/alt-fuel-stations/v1/nearest") do |faraday|
      faraday.headers["X-API-KEY"] =
      faraday.adapter Faraday.default_adapter
    end
  end
end
