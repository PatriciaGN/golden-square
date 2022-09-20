require_relative '../lib/music_library.rb'
require_relative '../lib/track.rb'

RSpec.describe "integration" do

  it "lists all tracks added"
    library = MusicLibrary.new
    track_1 = Track.new("Carte Blanche", "Veracocha")
    track_2 = Track.new("Synaesthesia", "The Thrillseekers")
    library.add(track_1)
    library.add(track_2)
    expect(library.all).to eq [track_1, track_2]
  end

  it "fails" do
    library = MusicLibrary.new
    track_1 = Track.new("", "Veracocha")
    library.add(track_1)
    expect{ library.all }.to raise_error "Please, enter a title"
  end

  it "fails" do
    library = MusicLibrary.new
    track_1 = Track.new("Can you feel the love tonight?", "")
    library.add(track_1)
    expect { library.all }.to raise_error "Please, enter an artist"
  end
  
  describe "search behaviour" do
    it "finds a track by the keyword" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      library.add(track_1)
      expect(library.search("Blanche").to eq [track_1]
    end

    it "fails if the keyword doesn't match" do
      library = MusicLibrary.new
      track_1 = Track.new("Carte Blanche", "Veracocha")
      library.add(track_1)
      expect{ library.search("Whatever") }.to raise_error "No matches found"
    end

    it "finds the tracks by the keyword" do
      library = MusicLibrary.new
      track_1 = Track.new("The killers", "Mr. Brightside")
      track_2 = Track.new("Synaesthesia", "The Thrillseekers")
      library.add(track_1)
      library.add(track_2)
      expect(library.search("The")).to eq [track_1, track_2]
    end    
  end
end