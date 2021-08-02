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

  def overstocked_items
    # would have used filter_map but my ruby version reverted to 2.6.3 somehow
    total_inventory.map do |item, inventory|
      item if inventory[:quantity] >= 50 && inventory[:food_trucks].length > 1
    end.compact
  end

  def sorted_item_list
    @food_trucks.flat_map do |truck|
      truck.item_names
    end.uniq.sort
  end
end
