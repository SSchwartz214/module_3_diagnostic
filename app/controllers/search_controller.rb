class SearchController < ApplicationController

  def index
    @stations = Station.find_all(params[:zip])
  end
end
