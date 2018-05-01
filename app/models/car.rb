class Car < ApplicationRecord
  validates :make, uniqueness: true, presence: true

  def self.by_model
    order(:model)
  end

  def self.by_price(direction = :asc)
    order(price: direction)
  end

  def paint(color)
    self.update(color: color)
  end

  def honk 
    'BEEP BEEP'
  end

  def info
    self.attributesg
  end

end
