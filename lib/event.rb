class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |truck|
      truck.name
    end.uniq
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |truck|
      truck.sell_item?(item)
    end.uniq
  end

  def total_inventory
    inventory = {}
    @food_trucks.each do |truck|
      truck.inventory.each do |item, amount|
        inventory[item] ||= {quantity: 0, food_trucks: []}
        inventory[item][:quantity] += amount
        inventory[item][:food_trucks] << truck
      end
    end
    inventory
  end
end
