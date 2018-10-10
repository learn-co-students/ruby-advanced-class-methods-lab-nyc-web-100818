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
    newer_song = self.create
    newer_song.name = song_name
    newer_song
  end

  def self.create_by_name(song)
    newer_song = self.create
    # newer_song = Song.new
    # newer_song.save
    newer_song.name = song
    newer_song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end


  def self.find_or_create_by_name(song)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

    def self.alphabetical
      self.all.sort_by { |song| song.name }
    end

    def self.new_from_filename(file_name)
      name = file_name.split(" - ")
      just_artist_name = name[0]
      song_name = name[1].split(".")[0]

      song_edited = self.new
      song_edited.name = song_name
      song_edited.artist_name = just_artist_name
      song_edited
    end

    def self.create_from_filename(song)
      self.new_from_filename(song).save  #calls new_from_filename and inputs (song) and saves it
    end

    def self.destroy_all
      @@all.clear
    end

end
