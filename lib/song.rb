

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

    made = self.new
    self.all << made
    made

  end

  def self.new_by_name (name)

    named = self.new
    named.name = name
    named

  end


  def self.create_by_name(name)

    named = self.new
    named.name = name
    self.all << named
    named

  end


  def self.find_by_name(name)

    ret = nil
    self.all.each do |song|
      if song.name == name
        ret = song
        break
      end
    end
    ret

  end

  def self.find_or_create_by_name(name)

    if !find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
    
  end

  def self.alphabetical

    self.all.sort {|a, b| a.name <=> b.name}


  end

  def self.new_from_filename(file)

    arr = file.split(".")
    arr2 = arr[0].split(" - ")
    artist_name = arr2[0]
    name = arr2[1]

    named = self.new
    named.name = name
    named.artist_name = artist_name
    named

  end

  

  def self.create_from_filename(file)

    arr = file.split(".")
    arr2 = arr[0].split(" - ")
    artist_name = arr2[0]
    name = arr2[1]

    named = self.new
    named.name = name
    named.artist_name = artist_name
    self.all << named
    named

  end

  def self.destroy_all
    self.all.clear
  end

end

Song.new_from_filename("Thundercat - For Love I Come.mp3")
