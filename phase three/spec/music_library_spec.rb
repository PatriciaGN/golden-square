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
      fake_track = double :fake_track
      library.add(fake_track)
      expect(library.all).to eq [fake_track]
    end
    
    it "adds several tracks to the @tracks_list and displays them" do
      library = MusicLibrary.new
      track1 = double :fake_track1
      track2 = double :fake_track2
      library.add(track1)
      library.add(track2)
      expect(library.all).to eq [track1, track2]
    end
  end

  describe "search" do
    it "fails if no matches found" do
      library = MusicLibrary.new
      track_1 = double :track, matches?: false
      library.add(track_1)
      expect { library.search("fake") }.to raise_error "No matches found"
    end
    
    it "finds a track by the keyword" do
      library = MusicLibrary.new
      track_1 = double :track, matches?: true  
      library.add(track_1)
      expect(library.search("Blanche")).to eq [track_1]
    end

    it "returns a track that is matched" do
      library = MusicLibrary.new
      track_1 = double :track, matches?: true
      track_2 = double :track, matches?: true
      Track_1 = double :track
      expect(track_1).to receive(:matches?).with("The").and_return(true)
      Track_2 = double :track
      expect(track_2).to receive(:matches?).with("The").and_return(false)
      library.add(track_1)
      library.add(track_2)
      expect(library.search("The")).to eq [track_1]
    end
  end
end

# class FakeOneTrack
#     def initialize(title, artist)
#         @title = title
#         @artist = artist
#     end

#     def matches?(keyword)
#       fail "Give me, give, give me a keyword after midnight" if keyword == ""
#       @title.include?(keyword) || @artist.include?(keyword)
#     end
# end    
