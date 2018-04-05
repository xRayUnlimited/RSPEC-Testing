class Car < ApplicationRecord
  validates :make, uniqueness: true, presence: true

  def self.by_model
    order(:model)
  end

  def self.by_price(direction = :asc)
    order(price: direction)
  end

  def paint
    @car.color
  end

  def honk =
    'BEEP BEEP'
  end

  def info
    true
  end

end
