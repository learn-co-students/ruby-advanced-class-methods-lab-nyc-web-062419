require "pry"
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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |song_instance|
      name == song_instance.name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) 
      self.find_by_name(name)
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |songs_instance|
      songs_instance.name
    end
  end

  def self.new_from_filename(file_name)
    song_split = file_name.split(" - ")
    song_artist_name = song_split[0] 
    song_name = song_split[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = song_artist_name
    song
  end

  def self.create_from_filename(file_name)
    song_split = file_name.split(" - ")
    song_artist_name = song_split[0] 
    song_name = song_split[1].gsub(".mp3","")
    song = self.create
    song.name = song_name
    song.artist_name = song_artist_name
    song  
  end

  def self.destroy_all
    @@all.clear
  end
end
