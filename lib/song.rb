require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  # Class reader that exposes the Class variable @@all
  def self.all
    @@all
  end

  #Class how to rememeber all the instances of itself
  #self always refers to the object itself right now
  def save
    self.class.all << self
  end

  #Class constructor- constucting new object, saving it and return it. 
  #represents old version of initialize and extends class functionality with custom constructor
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
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create_by_name(name) 
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    arr = filename.split(" - ")
    arr[1] = arr[1].chomp(".mp3")
    song = self.new
    song.name = arr[1]
    song.artist_name = arr[0]
    song
  end

  def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      song.save
      song
  end

  def self.destroy_all
    @@all.clear
  end

end
