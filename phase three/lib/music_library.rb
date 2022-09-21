require "track.rb"

class MusicLibrary
    def initialize
      @tracks_list = []
    end
  
    def add(track) 
      @tracks_list << track
    end
  
    def all
      return @tracks_list
    end
    
    def search(keyword) 
      @matched_tracks = []
      matches = false
      @tracks_list.each do |track|
        if track.matches?(keyword)
          @matched_tracks << track 
          matches = true
        end
      end
      fail "No matches found" if matches == false
      @matched_tracks
    end
  end