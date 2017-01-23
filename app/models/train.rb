class Train < ApplicationRecord
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets
  has_many :carriages, before_add: :add_number

  def counting_seats(type_carriage, type_seat)
    carriage.where('type = ?', type_carriage).sum("#{type_seat}".to_sym)
  end

  def current_order_carriages
    order_carriages ? carriages.head : carriages.tail
  end


  validates :number, presence: true
end
