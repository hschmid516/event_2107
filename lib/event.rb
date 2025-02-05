class Event
  attr_reader :name, :food_trucks, :date

  def initialize(name)
    @name = name
    @food_trucks = []
    @date = Date.today.strftime("%d/%m/%Y")
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
    @food_trucks.reduce({}) do |acc, truck|
      truck.inventory.each do |item, amount|
        acc[item] ||= {quantity: 0, food_trucks: []}
        acc[item][:quantity] += amount
        acc[item][:food_trucks] << truck
      end
      acc
    end
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

  def sell(item, amount)
    if total_inventory[item][:quantity] > amount
      total_inventory[item][:food_trucks].each do |truck|
        truck.reduce_stock(item, amount)
      end
      true
    else
      false
    end
  end
end
