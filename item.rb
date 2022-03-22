require 'date'

class Item
  attr_reader :label, :genre, :author, :id
  attr_accessor :publish_date

  def initialize(publish_date, _id, archived: false)
    @publish_date = publish_date
    @id = Random.rand(1..1000)
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today.year
    current_date - Date.parse(@publish_date).year > 10
  end

  def label=(label)
    @label = label
    label.items.push(self) unless @label.items.include?(self)
  end
end
