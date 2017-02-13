class Carriage < ApplicationRecord
  belongs_to :train

  validates :number, uniqueness: { scope: :train_id,
    message: 'Number is already in use for this train' }

  def self.inherited(base)
    super
    def base.model_name
      superclass.model_name
    end
  end

  before_validation :add_number

  scope :coupe,    -> { where(type: 'CoupeCarriage') }
  scope :economy,  -> { where(type: 'EconomyCarriage') }
  scope :sitting,  -> { where(type: 'SittingCarriage') }
  scope :lux, -> { where(type: 'LuxCarriage') }
  scope :ordered, ->(asc = true) { order(number: asc ? :asc : :desc) }

  private

  def add_number
    if train
      max_number = Carriage.where(train: train).maximum(:number)
      self.number ||= max_number.nil? ? 1 : max_number.to_i + 1
    end
  end
end
