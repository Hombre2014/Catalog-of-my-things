module Helpers
  def file_open(filename)
    if File.exist?(filename)
      file = File.open(filename)
      file_data = file.read
      JSON.parse(file_data)
    else
      []
    end
  end

  def read_file(filename)
    case filename
    when 'books.json' then retrive_books(file_open(filename))
    when 'music_albums.json' then retrive_persons(file_open(filename))
    when 'games.json' then retrive_rentals(file_open(filename))
    when 'ganres.json' then retrive_rentals(file_open(filename))
    when 'labels.json' then retrive_rentals(file_open(filename))
    when 'authors.json' then retrive_rentals(file_open(filename))
    end
  end

  def save_file(filename, json)
    file = File.new(filename, 'w')
    file.puts(json)
    file.close
  end

  def list_books
    
  end

  def list_music_albums
    
  end

  def list_games
    
  end

  def list_genres
    
  end

  def list_labels
    
  end

  def list_authors
    
  end

  def add_book
    
  end

  def add_music_album
    
  end

  def add_game
    
  end
end
