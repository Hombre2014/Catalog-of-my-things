require_relative '../item'
require_relative '../author'

describe 'Authors and Items' do
  context 'Testing Items' do
    author = Author.new('John', 'Clayton')
    item = Item.new(id: nil, publish_date: Date.parse('2020/02/02'))

    it 'should display author first name' do
      expect(author.first_name).to eq 'John'
    end

    it 'should expect author first name to be a string' do
      expect(author.first_name).to be_kind_of(String)
    end

    it 'should expect author last name to be a string' do
      expect(author.last_name).to be_kind_of(String)
    end

    it 'should expect publish date to be a date' do
      expect(item.publish_date).to be_kind_of(Date)
    end

    it 'should display author last name' do
      expect(author.last_name).to eq 'Clayton'
    end

    it 'should return the item passed into author items array' do
      author.add_item(item) 
      expect(author.items[0]).to eq(item) 
    end
    
    it 'should increase array length of items array' do
      author.add_item(item) 
      expect(author.items.length).to eq(2) 
    end

    it 'should expect id of item to be an integer' do
      expect(item.id).to be_kind_of(Integer)
    end 

    it 'should be an instance of' do
      expect(item).to be_an_instance_of Item
    end
  end
end