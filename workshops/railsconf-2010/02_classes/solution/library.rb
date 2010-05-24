class Library
  attr_reader :catalog
  attr_reader :checked_out

  def initialize
    @catalog ||=[]
    @checked_out ||= []
  end

  def add(media)
    @catalog << media
  end

  def checkout(media)
    raise NoMediaExistsException unless @catalog.include?(media)
    media.checkout!
    @checked_out << media
  end
end

class NoMediaExistsException < Exception ; end

module Media
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def checkout!
    @checked_out = true
  end

  def checked_out?
    @checked_out ||= false
  end
end

class Video
  include Media
end

class Book
  include Media
end

