require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  #this method acts as a reader for the @@all class variable. This method exposes this piece of data to the rest of our application
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    # "= self.all" to save the song to @all?
    # returns the song that was created

    # our song is created with self.new, self.new creates a new INSTANCE of our class
    song = self.new
    # song.save is a class method. above we can see that it shovels instances into the @@array. so we take our new instance "song" (because we created it with self.new in the line above and set it equal to that) and we call the class method save on it.
    song.save
    #simply calling song returns our new instance
    song
  end

  def Song.new_by_name(name)
    #takes in the string name of a song and returns a song instance with that name set as its name property

    #our song is created with self.new
    song = self.new
    #song.name is a class method? that gets the name attribute of the newly created song from the name accessor
    song.name = name
    #we simply return our song instance with "song"
    song
  end

  def Song.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def Song.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def Song.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)
  end

  def Song.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def Song.new_from_filename(filename)
    delimiters = [' - ','.mp3']
    cut = filename.split(Regexp.union(delimiters))
    artist_name = cut[0]
    song_name = cut[1]

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def Song.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def Song.destroy_all
    self.all.clear
  end





end
