require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @@all << self
  end

  def self.create
    Song.new
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.find_by_name(name) 
     @@all.find {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
     self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    seperated = filename.split ' - '
    artist = seperated[0]
    song_name = seperated[1].split('.')[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    seperated = filename.split ' - '
    artist = seperated[0]
    song_name = seperated[1].split('.')[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
