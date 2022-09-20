require_relative "../lib/music_library.rb"

describe MusicLibrary do
  describe "initialize" do
    it "constructs an empty array" do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end
  end

  describe "add + all" do
    it "adds a track to the @tracks_list and displays it" do
      library = MusicLibrary.new
      fake_track = FakeOneTrack.new("fake", "fake")
      library.add(fake_track)
      expect(library.all).to eq [fake_track]
    end
    
    it "adds several tracks to the @tracks_list and displays them" do
      library = MusicLibrary.new
      fake_track1 = FakeOneTrack.new("fake", "fake")
      fake_track2 = FakeOneTrack.new("fake2", "fake2")
      library.add(fake_track1)
      library.add(fake_track2)
      expect(library.all).to eq [fake_track1, fake_track2]
    end
  end

  describe "search" do
    it "fails if no matches found" do
      library = MusicLibrary.new
      track_1 = FakeOneTrack.new("Carte Blanche", "Veracocha")
      library.add(track_1)
      expect { library.search("fake") }.to raise_error "No matches found"
    end
    
    it "finds a track by the keyword" do
      library = MusicLibrary.new
      track_1 = FakeOneTrack.new("Carte Blanche", "Veracocha")
      library.add(track_1)
      expect(library.search("Blanche")).to eq [track_1]
    end

    it "returns a track that is matched" do
      library = MusicLibrary.new
      track_1 = FakeOneTrack.new("The killers", "Mr. Brightside")
      track_2 = FakeOneTrack.new("Synaesthesia", "The Thrillseekers")
      library.add(track_1)
      library.add(track_2)
      expect(library.search("The")).to eq [track_1, track_2]
    end
  end
end

class FakeOneTrack
    def initialize(title, artist)
        @title = title
        @artist = artist
    end
end    
  
class FakeMatch
  def matches?
    true
  end
end