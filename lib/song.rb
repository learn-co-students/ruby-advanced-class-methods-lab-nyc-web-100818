require 'pry'
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
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    name = file_name.split(" - ")
    artist_name = name[0]
    song_name = name[1].split(".")[0]
    new_song = Song.new
    new_song.name = song_name
    new_song.artist_name = artist_name
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end

  def self.destroy_all
    @@all.clear
  end



    # song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
    # song.name #=> "Blank Space"
    # song.artist_name #=> "Taylor Swift"

end
