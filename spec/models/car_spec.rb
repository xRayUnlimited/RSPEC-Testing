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
      @car1 = Car.create(
        { make: 'Toyota', 
          model: 'Prius', 
          price: 20000 })
      @car2 = Car.create(
        { make: 'Ford', 
          model: 'F-150', 
          price: 19999 })
      @car3 = Car.create(
        { make: 'Abe', 
          model: 'Lincoln', 
          price:1900 })
    end
    
    it 'sorts by model ASC' do
      cars = Car.by_model
      expect(cars.first).to eq(@car2)
      expect(cars.last).to eq(@car1)
    end

    it 'sorts by price ASC' do
    end

    it 'sorts by price DESC' do
    end
  end

end