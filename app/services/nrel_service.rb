class NrelService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-Api-Key"] = ENV["nrel_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def find_stations
    get_url("/api/alt-fuel-stations/v1/nearest.json?location=#{@zip}")
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_stations(zip)
    new(zip).find_stations
  end
end
