require_relative '../lib/track.rb'

RSpec.describe Track do
  describe "initialize" do
    it "constructs" do
      track_1 = Track.new("my_title", "my_artist")
    end
  end
       
  describe "matches?" do
    it "fails if keyword is an empty string" do
      track_1 = Track.new("my_title", "my_artist")
      expect { track_1.matches?("") }.to raise_error "Give me, give, give me a keyword after midnight"
    end
       
    it "returns true if the track matches the keyword" do
      track_1 = Track.new("my_title", "my_artist")
      expect(track_1.matches?("title")).to eq true
    end
    
    it "returns false if the track doesn't match the keyword" do
      track_1 = Track.new("my_title", "my_artist")
      expect(track_1.matches?("Snore")).to eq false 
    end
  end
end