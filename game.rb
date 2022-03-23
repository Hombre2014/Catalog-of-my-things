require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :author, :multiplayer, :last_played_at
  attr_reader :archived

  def initialize(multiplayer, last_played_at, published_date)
    super(id: nil, publish_date: published_date)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
  end

  def can_be_archived?
    current_date = Date.today.year
    false unless can_be_archived? && current_date - last_played_at.year > 2
  end
end
