require 'pry'
class Song
  attr_accessor :name
  @@all = []

  def self.all
    @@all
  end

  def artist_name=(artist_name)
    @artist_name = artist_name
  end

  def artist_name
    @artist_name
  end

  def save
    self.class.all << self
  end

  def Song.create
    var = Song.new
    @@all << var
    var
  end

  def Song.new_by_name(song_name)
    var = Song.new
    var.name = song_name
    var
  end

  def Song.create_by_name(song_name)
    var = Song.new
    var.name = song_name
    @@all << var
    var
  end

  def Song.find_by_name(name)
    self.all.find do |song_instance|
      song_instance.name == name
    end
  end

  def Song.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def Song.new_from_filename(song_name)
    var = Song.new
    var.name = song_name.split('')[13..27].join
    var.artist_name = song_name.split('')[0..9].join
    var
  end

  def Song.create_from_filename(song_name)
    var = Song.new
    one = song_name[0..song_name.length-5].split(' - ')
    var.name = one[1]   #song_name.split('')[13..27].join
    var.artist_name = one[0]  #song_name.split('')[0..9].join
    @@all << var
  end

  def Song.alphabetical
    self.all.sort_by{|song_instance| song_instance.name}
  end

  def self.destroy_all
    self.all.clear
  end
end
