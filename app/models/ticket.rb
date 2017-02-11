class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :passenger_name, :passenger_passport, presence: true

  after_create :notify_buy
  after_destroy :notify_cancellation_buy

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def notify_buy
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def notify_cancellation_buy
    TicketsMailer.cancellation_buy_ticket(self.user, self).deliver_now
  end
end
