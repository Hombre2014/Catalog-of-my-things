require 'date'
require_relative '../music_album'

describe 'Music album test' do
  context 'Should create a new music album' do
    new_album = MusicAlbum.new('The greatest hits', Date.parse('1998-10-24'), true)

    it 'creates a new music album' do
      expect(new_album.name).to eq('The greatest hits')
    end

    it 'it should be an instance of MusicAlbum class' do
      expect(new_album).to be_an_instance_of MusicAlbum
    end

    it 'should have a published date of 1998/10/24' do
      expect(new_album.publish_date).to eq Date.parse('1998-10-24')
    end

    it 'should be on spotify' do
      expect(new_album.on_spotify).to eq(true)
    end
  end
end
