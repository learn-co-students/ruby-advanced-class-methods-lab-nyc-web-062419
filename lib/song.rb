require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    s = Song.new
    @@all << s
    s
  end
  def self.new_by_name(name)
    s = Song.new(name)
  end
  def self.create_by_name(name)
    s = Song.new(name)
    @@all << s
    s
  end
  def self.find_by_name(searchName)
    @@all.each do |song|
      if song.name == searchName
        return song
      end
    end
    return nil
  end
  def self.find_or_create_by_name(searchName)
    # binding.pry
    if find_by_name(searchName) == nil
      newS = create_by_name(searchName)
      return newS
    else
      return find_by_name(searchName)
    end
  end
  def self.alphabetical
    sorted = @@all.sort_by { |song| song.name }
    return sorted
  end
  def self.new_from_filename(filename)
    filename.split("-")
    artist = filename.split("-")[0][0...filename.split("-")[0].length - 1]
    song = filename.split("-")[1][1...filename.split("-")[1].length - 4]
    newSong = Song.new
    newSong.artist_name = artist
    newSong.name = song
    return newSong
  end
  def self.create_from_filename(filename)
    filename.split("-")
    artist = filename.split("-")[0][0...filename.split("-")[0].length - 1]
    song = filename.split("-")[1][1...filename.split("-")[1].length - 4]
    s = Song.create
    s.name = song
    s.artist_name = artist
    return s
  end
  def self.destroy_all
    @@all = []
  end
end
