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

  def self.new_by_name(new_name)
  	song = Song.new
  	song.name = new_name
  	song.save
  	song
  end

  def self.create_by_name(new_name)
  	song = Song.new
  	song.name = new_name
  	song.save
  	song
  end

  def self.find_by_name(name)
  	@@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name) == nil
  		self.create_by_name(name)
  	else self.find_by_name(name)
  	end
  end

  def self.alphabetical
  	@@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  	info = filename.split(" - ")
  	artist_name = info[0]
  	song_name = info[1].split(".")
  	new_name = song_name[0]

  	song = Song.new
  	song.name = new_name
  	song.artist_name = artist_name
  	song
  end

  def self.create_from_filename(filename)
  	info = filename.split(" - ")
  	artist_name = info[0]
  	song_name = info[1].split(".")
  	new_name = song_name[0]

  	song = Song.create
  	song.name = new_name
  	song.artist_name = artist_name
  	song
  end

  def self.destroy_all
  	@@all.clear
  end
end
