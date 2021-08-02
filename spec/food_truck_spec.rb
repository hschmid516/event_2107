require './lib/item'
require './lib/food_truck'

RSpec.describe FoodTruck do
  context 'I1' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    it 'exists and has attributes' do
      expect(food_truck).to be_a(FoodTruck)
      expect(food_truck.name).to eq("Rocky Mountain Pies")
      expect(food_truck.inventory).to eq({})
    end

    it 'starts with no stock' do
      expect(food_truck.check_stock(item1)).to eq(0)
    end

    it 'can add stock' do
      food_truck.stock(item1, 30)

      expect(food_truck.inventory).to eq({item1 => 30})
    end
  end
end
