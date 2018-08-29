class NrelService
  def initialize(zip)
    @zip = zip
    @conn = Faraday.new("https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=80203") do |faraday|
      faraday.headers["X-Api-Key"] = ENV["nrel_key"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_url
    response = @conn
    JSON.parse(response.body, symbolize_names: true)
  end
end
