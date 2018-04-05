class Car < ApplicationRecord
  validates :make, uniqueness: true, presence: true

  def self.by_model
    order(:model)
  end
end
