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

  def self.new_by_name(s_name)
    song = self.new
    song.name = s_name
    song
  end

  def self.create_by_name(s_name)
    song = self.create
    song.name = s_name
    song
  end

  def self.find_by_name(s_name)
    self.all.find do |song|
      song.name == s_name
    end
  end

  def self.find_or_create_by_name(s_name)
    self.find_by_name(s_name) || self.create_by_name(s_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    split_string =  filename.split(" - ")
    a_name = split_string[0]
    s_name = split_string[1].gsub(".mp3", "")
    song = self.new
    song.name = s_name
    song.artist_name = a_name
    song
  end

  def self.create_from_filename(filename)
    split_string =  filename.split(" - ")
    a_name = split_string[0]
    s_name = split_string[1].gsub(".mp3", "")
    song = self.create
    song.name = s_name
    song.artist_name = a_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
