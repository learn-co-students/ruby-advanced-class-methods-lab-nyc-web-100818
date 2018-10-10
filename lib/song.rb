class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil,artist_name=nil)
    @name = name if name != nil
    @artist_name = artist_name if name != nil
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(x)
    @@all.each do |song|
      return song if song.name.include?(x)
    end
    nil
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{ |song| song.name }
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    file[1].slice!('.mp3')
    self.new(file[1], file[0])
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end

end
