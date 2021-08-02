class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(item)
    @inventory[item] ||= 0
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def sell_item?(item)
    @inventory.keys.include?(item)
  end

  def potential_revenue
    revenue = 0
    @inventory.each do |item, amount|
      revenue += item.price[1..-1].to_f * amount
    end
    revenue
  end

  def item_names
    names = []
    @inventory.each do |item, amount|
      names << item.name
    end
    names
  end
end
