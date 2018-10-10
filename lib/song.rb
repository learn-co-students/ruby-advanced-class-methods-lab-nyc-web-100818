class Song
  attr_accessor :name, :artist_name
  @@all = []

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
    found_song = find_by_name(name)
    if  found_song == nil
      create_by_name(name)
    else
      found_song
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1].split(".mp3")[0]
    song = Song.new

    song.name = song_name
    song.artist_name = artist
    song


  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist = data[0]
    song_name = data[1].split(".mp3")[0]
    song = Song.create

    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end







end
