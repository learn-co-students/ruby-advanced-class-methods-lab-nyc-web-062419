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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    if self.find_by_name(name) != nil
      # binding.pry
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    name = song_info[1].chomp('.mp3')
    song = self.new_by_name(name)
    song.artist_name = song_info[0]
    song
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ")
    name = song_info[1].chomp('.mp3')
    # binding.pry
    song = self.create_by_name(name)
    song.artist_name = song_info[0]
  end

  def self.destroy_all
    self.all.clear
  end

end
