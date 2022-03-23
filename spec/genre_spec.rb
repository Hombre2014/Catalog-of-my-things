require_relative '../genre'
require_relative '../item'

describe 'Genre test' do
  context 'Should create a new genre' do
    new_item = Item.new(id: nil, publish_date: Date.parse('2000/11/20'))
    genre = Genre.new('Rock and Roll')

    it 'creates a new genre' do
      expect(genre.name).to eq 'Rock and Roll'
    end

    it 'add a new item' do
      genre.add_item(new_item)
      expect(genre.items.length).to eq 1
    end
  end
end
