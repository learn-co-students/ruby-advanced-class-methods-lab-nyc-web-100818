class Song

  attr_accessor :name, :artist_name

  @@all = []

  def Song.create
    song = Song.new
    @@all << song
    song
  end

  def Song.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def Song.create_by_name(name)
    song = Song.new
    song.name = name
    @@all << song
    song
  end

  def Song.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def Song.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def Song.all
    @@all
  end

  def Song.new_from_filename(filename)
    song = Song.new
    artist = filename.split(" - ")[0]
    title = filename.split(" - ")[1].chomp(".mp3")
    song.name = title
    song.artist_name = artist
    song
  end

  def Song.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    @@all << song
    song
  end

  def Song.destroy_all
    Song.all.clear
  end

  def save
    Song.class.all << Song
  end

end
