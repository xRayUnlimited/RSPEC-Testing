require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do
    it 'has a make' do
      expected = 'Toyota'
      actual = Car.create(make: expected)
      expect(actual.make).to eq(expected)
    end
  end
end
