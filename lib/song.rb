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

  def self.new_by_name(x)
    song = self.new
    song.name = x
    song
  end

  def self.create_by_name(x)
    song = self.new
    song.name = x
    @@all << song
    song
  end

  def self.find_by_name(song_title)
    @@all.find do |matching_song|
      if matching_song.name == song_title
        return matching_song
      end
    end
  end

    def self.find_or_create_by_name(song_name)
        if self.find_by_name(song_name)
          return self.find_by_name(song_name)
        else
          return self.create_by_name(song_name)
        end
      end

    def self.alphabetical
      @@all.sort_by{|x| x.name[0]}
    end

    def self.new_from_filename(song)
    split = song.split("-")
    one = split[0].strip
    two = split[1].strip
    three = two.split(".")
    song = self.new
    song.name = three[0]
    song.artist_name = one
    song
    end

    def self.create_from_filename(song)
      split = song.split("-")
      one = split[0].strip
      two = split[1].strip
      three = two.split(".")
      song = self.new
      song.name = three[0]
      song.artist_name = one
      song.save
      song
    end

    def self.destroy_all
      @@all.clear
    end



    end

    describe '.create_from_filename' do
      it 'initializes and saves a song and artist_name based on the filename format' do
        song = Song.create_from_filename("Thundercat - For Love I Come.mp3")
        song_match = Song.find_by_name("For Love I Come")
        expect(song_match.name).to eq("For Love I Come")
        expect(song_match.artist_name).to eq("Thundercat")
      end
    end
