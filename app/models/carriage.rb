class Carriage < ApplicationRecord
  belongs_to :train
  validates :number, uniqueness: { scope: :train_id,
    message: 'Number is already in use for this train' }
  before_validation :add_number

  scope :tail, -> { order('number DESC') }
  scope :head, -> { order('number ASC') }

  def self.inherited(base)
    super
    def base.model_name
      superclass.model_name
    end
  end


  private

  def add_number
    if train
      max_number = train.carriages.maximum(:number)
      self.number ||= max_number.nil? ? 1 : max_number + 1
    end
  end
end
