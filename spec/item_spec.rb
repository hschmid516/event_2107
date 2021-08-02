require './lib/item'

RSpec.describe Item do
  it 'exists and has attributes' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    expect(item1).to be_a(Item)
    expect(item1.name).to eq('Peach Pie (Slice)')
    expect(item1.price).to eq("$3.75")
  end
end
