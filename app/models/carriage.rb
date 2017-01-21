class Carriage < ApplicationRecord
  belongs_to :train

  scope :economy, -> { where(type: 'EconomyCarriage')}
  scope :coupe, -> { where(type: 'CoupeCarriage')}
  scope :ordered, -> { order (:number) }

  scope :tail, -> { order('number DESC')}
  scope :head, -> { order('number ASC')}

  validates :number, :top_seats, :bottom_seats, presence: true
end
