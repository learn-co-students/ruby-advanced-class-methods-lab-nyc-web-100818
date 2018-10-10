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
    song = self.new 
    @@all << song 
    song 
  end 

  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song  
  end 

  def self.create_by_name(name)
    song = self.new_by_name(name)
    # binding.pry
    @@all << song 
    song 
  end 

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name 
    end 
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end 

  def self.alphabetical 
    self.all.sort_by do |song|
      song.name
    end  
  end 

  def self.new_from_filename(file)
    song = self.create 
    filename = file.split(" - ")
    song.artist_name = filename[0]
    song.name = filename[1].split('.')[0]
    song
  end 

  def self.create_from_filename(file)
    song = self.create 
    filename = file.split(" - ")
    song.artist_name = filename[0]
    song.name = filename[1].split('.')[0]
    song
  end 

  def self.destroy_all
    self.all.clear
  end
end


vera = Song.new 
puts vera 

Song.create_by_name('yo')
Song.create_by_name('vera')
Song.find_by_name('vera')
Song.new_from_filename('vera - something something.pms')
