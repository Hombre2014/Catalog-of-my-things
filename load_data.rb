class LoadData
  def initialize(music_albums, genres, book,label)
    @music_albums = music_albums
    @genres = genres
    @book = book
    @label = label
  end

  def load_music_albums
    json = File.read('music_albums.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |music_album|
        new_music_album = MusicAlbum.new(music_album['name'], music_album['publish_date'], music_album['on_spotify'])
        new_music_album
      end
    end
  end

  def load_genres
    json = File.read('genres.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |genre|
        new_genre = Genre.new(genre['name'])
        new_genre
      end
    end
  end

  def load_books
    json = File.read('books.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |book|
        new_book = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        new_book
      end
    end
  end
  
  def load_labels
    json = File.read('labels.json')
    if json.empty?
      []
    else
      parsed_json = JSON.parse(json)
      parsed_json.map do |label|
        new_label = Label.new(label['title'], label['color'])
        new_label
      end
    end
  end
end
