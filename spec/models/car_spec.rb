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
      @car1 = Car.create({ 
        make: 'Toyota', 
        model: 'Prius', 
        price: 20000 
      })

      @car2 = Car.create({
        make: 'Ford', 
        model: 'F-150', 
        price: 19999
      })

      @car3 = Car.create({
        make: 'Abe', 
        model: 'Lincoln', 
        price:1900
      })
    end
    
    it 'sorts by model ASC' do
      cars = Car.by_model
      expect(cars.first).to eq(@car2)
      expect(cars.last).to eq(@car1)
    end

    it 'sorts by price ASC' do
      cars = Car.by_price
      expect(cars.first).to eq(@car3)
      expect(cars.last).to eq(@car1)
    end

    it 'sorts by price DESC' do
      cars = Car.by_price(:desc)
      expect(cars.first).to eq(@car1)
      expect(cars.last).to eq(@car3)
    end
  end

  describe 'behavior' do
    before(:each) do
      @attrs = {
        make: 'Toyota', 
        model: 'Tacoma',
        color: 'green',
        price: 20000
      }

      @car = Car.create(@attrs)
    end

    it 'can be painted' do
      color = 'rainbow'
      @car.paint(color)
      expect(@car.color).to eq(color)
    end

    it 'honks' do
      expect(@car.honk).to eq('BEEP BEEP')
    end

    it 'displays info' do
      expect(@car.info).to eq(@attrs)
    end
  end

end