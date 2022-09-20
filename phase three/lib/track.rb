# File: lib/track.rb

class Track
    def initialize(title, artist)
      @title = title
      @artist = artist 
    end
  
    def matches?(keyword)
      fail "Give me, give, give me a keyword after midnight" if keyword == ""
      @title.include?(keyword) || @artist.include?(keyword)
    end
  end