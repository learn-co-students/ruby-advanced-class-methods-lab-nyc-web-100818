class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.new_from_filename(filename)
    song_arr = filename.split(" - ")
    artist_name = song_arr[0]
    song_name = song_arr[1].slice(0,song_arr[1].length - 4)
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    @@all << song
    song
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find{|song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    if found_song
      found_song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.destroy_all
    @@all.clear
  end
end
