require_relative '../item'
require_relative '../label'

describe 'Labels and Items' do
  before :each do
    @label = Label.new('Jhon', 'red')
    @item = Item.new(id: nil, publish_date: '2020/02/02')
  end

  it 'should display label title' do
    expect(@label.title).to eq 'Jhon'
  end

  it 'should return a label object' do
    expect(@label).to be_an_instance_of Label
  end

  it 'should expect label name to be a string' do
    expect(@label.title).to be_kind_of(String)
  end

  it 'should expect label color to be a string' do
    expect(@label.color).to be_kind_of(String)
  end

  it 'should expect label color to be red' do
    expect(@label.color).to eq 'red'
  end

  it 'should be able to add an item to a label' do
    @label.add_item(@item)
    expect(@label.items).to include(@item)
  end

  it 'should be lenght of items array to be 1' do
    @label.add_item(@item)
    expect(@label.items.length).to eq 1
  end
end
