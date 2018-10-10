class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
     song = self.new
     song.save
     song
   end

   def self.new_by_name(song_name)
     song = self.new
     song.name = song_name
     song
   end

   def self.create_by_name(song_name)
     song = self.new
     song.name = song_name
     song.save
     song
   end

   def self.find_by_name(song_name)
     self.all.detect do |song|
       song.name == song_name
     end
   end

   def self.find_or_create_by_name(this_song)
     if self.find_by_name(this_song) == nil
       self.create_by_name(this_song)
     else
       self.find_by_name(this_song)
     end
   end

   def self.alphabetical
     self.all.sort_by do |song|
       song.name
     end
   end

   def self.new_from_filename(file_name)
     song_name = file_name.split(/[-.]/)
     song = self.new
     song.name = song_name[1].chomp.lstrip
     song.artist_name = song_name[0].lstrip.chop
     song.save
     song
   end

   def self.create_from_filename(file_name)
     song_name = file_name.split(/[-.]/)
     song = self.new
     song.name = song_name[1].chomp.lstrip
     song.artist_name = song_name[0].lstrip.chop
     song.save
     song
   end

   def self.destroy_all
     self.all.clear
   end 

  def save
    self.class.all << self
  end

end
