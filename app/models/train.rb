class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def count_seats_by_type(type_carriage, type_seat)
    carriages.where(type: type_carriage).sum(type_seat)
  end

  def count_carriages_by_type(type_carriage)
    carriages.where(type: type_carriage).count
  end

end
