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
    counter = 1
    self.all.each do |song|
      if song.name == name
        return song
        counter += 1
      end
    end
      if counter > 1
        return false
      end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(path)
    path_split = path.split(" - ") #split filename
    name_fix = path_split[1].chomp(".mp3") #remove .mp3 from song title
    song = Song.new
    song.name = name_fix
    song.artist_name = path_split[0]
    song
  end

  def self.create_from_filename(path)
    path_split = path.split(" - ") #split filename
    name_fix = path_split[1].chomp(".mp3") #remove .mp3 from song title
    song = Song.new
    song.name = name_fix
    song.artist_name = path_split[0]
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end


end #class Song

# Song.new_from_filename
# binding.pry
#
# puts "Hello"
