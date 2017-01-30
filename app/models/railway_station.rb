class RailwayStation < ApplicationRecord
  #has_and_belongs_to_many :routes
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").distinct }

  def update_position(route, position)
    station = route_station(route)
    station.update(position: position) if station
  end

  def position_in(route)
    route_station(route).try(:position)
  end

  def update_time(route, arrival, departure)
    station = route_station(route)
    station.update(arrival: arrival, departure: departure) if station
  end

  def time(route, time_type)
    route_station(route).try(time_type)
  end

  private

    def station_route(route)
      @station_route ||= railway_stations_routes.where(route_id: route).first
    end

end
