class Carriage < ApplicationRecord
  belongs_to :train

  validates :type_w, :top_seats, :low_seats, presence: true
end
