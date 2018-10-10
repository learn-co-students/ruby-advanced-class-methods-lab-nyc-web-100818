class Song
  attr_accessor :name, :artist_name
  @@all = [] # will hold all of the song instances

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    end
    find_by_name(name) # return the object that matches it
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    data = file_name.split(" - ")   # ["Taylor Swift", "Blank Space.mp3"]
    artist = data[0]
    song_name = data[1].split(".mp3")[0] # returning the string

    # created a new instance of the song class and giving it attributes and finally returning it!
    song = Song.new

    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file_name)
    data = file_name.split(" - ")   # ["Taylor Swift", "Blank Space.mp3"]
    artist = data[0]
    song_name = data[1].split(".mp3")[0] # returning the string

    # created a new instance of the song class and giving it attributes and finally returning it!
    song = Song.new

    song.name = song_name
    song.artist_name = artist
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
