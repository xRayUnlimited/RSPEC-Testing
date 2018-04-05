require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'attributes' do
    it { should respond_to :make }
    it { should respond_to :model }
    it { should respond_to :price }
    it { should respond_to :color }
    it { should respond_to :interior }
    it { should respond_to :mileage }
  end

  describe 'validations' do
    it { should validate_presence_of :make }
    it { should validate_uniqueness_of :make }
  end

  describe 'filtering' do
    before(:each) do
      [
        { make: 'Toyota', model: 'Prius', price: 20000 },
        { make: 'Ford', model: 'F-150', price: 19999 },
        { make: 'Abe', model: 'Lincoln', price:1900 }
      ].each do |attrs|
        Car.create(attrs)
      end
    end
    
    it 'sorts by model ASC' do
      cars = Car.by_model
      expect(cars.first.model).to eq('F-150')
      expect(cars.last.model).to eq('Prius')
    end

    it 'sorts by price ASC' do
    end

    it 'sorts by price DESC' do
    end
  end

end