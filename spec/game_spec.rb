require_relative '../game'

describe 'Games' do
  context 'Testing Items' do
    game = Game.new('Yes', '2020/02/02', Date.parse('2020/02/02'))

    it 'should display yes for multiplayer' do
      expect(game.multiplayer).to eq 'Yes'
    end

    it 'should display 2020/02/02 for last_played_at' do
      expect(game.last_played_at).to eq Date.parse('2020/02/02')
    end

    it 'should display 2020/02/02 for publish_date' do
      expect(game.publish_date).to eq Date.parse('2020/02/02')
    end

    it 'should expect id of game to be an integer' do
      expect(game.id).to be_kind_of(Integer)
    end 

    it 'should be an instance of' do
      expect(game).to be_an_instance_of Game
    end
  end
end