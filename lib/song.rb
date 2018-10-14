require 'pry'

class Song
  
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    #[]
    @@all
  end

  def save
    #self.class.all == Person.all << instance var
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    #why is this 'self' == 'Song' ?
    song = self.new
    song.name = name
    #binding.pry
    song
  end

  def self.create_by_name(name)
    #create new song instance
    song = self.new #<Song:0x007f95a29c47a0>
    #set song w/(@name setter_method) = 'name'
    song.name = name #"Blank Space"
    @@all << song #<Song:0x007f95a29c47a0 @name="Blank Space">
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    #will either: find_by_name *OR* create_by_name
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    # same: @@all.sort_by
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(song)
    #do the manipulating first

    filename = song.split(" - ") #["Thundercat", "For Love I Come.mp3"]
    artist = filename[0] #"Thundercat"
    title = filename[1].split(".").first #["For Love I Come", "mp3"]
    #binding.pry

    #then instantiate new song
    song = self.new
    song.name = title
    song.artist_name = artist
    song

  end

  def self.create_from_filename(song)
    #I kind of understand how I got here??
    @@all << self.new_from_filename(song)
  end


  def self.destroy_all
    #empty @@all array thru class reader Person.all
    self.all.clear
  end

end
