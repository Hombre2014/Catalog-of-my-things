require_relative '../book'
require_relative '../item'

describe 'Books and Items' do
  before :each do
    @book = Book.new('Jhon', 'bad', publish_date: '2020/02/02')
    @item = Item.new(id: nil, publish_date: Date.parse('2020/02/02'))
  end

  it 'should display publisher name' do
    expect(@book.publisher).to eq 'Jhon'
  end

  it 'should return a book object' do
    expect(@book).to be_an_instance_of Book
  end

  it 'should expect publisher name to be a string' do
    expect(@book.publisher).to be_kind_of(String)
  end

  it 'should expect cover state to be a string' do
    expect(@book.cover_state).to be_kind_of(String)
  end

  it 'should expect publish date to be a date' do
    expect(@book.publish_date).to be_kind_of(Hash)
  end

  it 'should expect cover state to be a string' do
    expect(@book.cover_state).to eq 'bad'
  end
end
