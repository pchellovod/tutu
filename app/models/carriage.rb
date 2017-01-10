class Carriage < ApplicationRecord
  belongs_to :train

  validates :type_w, presence: true
end
