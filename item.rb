require 'date'

class Item
  attr_reader :label, :genre, :author, :id
  attr_accessor :publish_date

  def initialize(id:, publish_date:, archived: false)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def genre=(genre)
    @genre = genre
    @genre.add_item(self) unless @genre.items.include?(self)
  end

  def game_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless @label.items.include?(self)
  end

  private

  def can_be_archived?
    current_date = Date.today.year
    current_date - Date.parse(@publish_date).year > 10
  end
end
