{{PROBLEM}} Multi-Class Planned Design Recipe
1. Describe the Problem
  As a user
  I want to be able to add and display my music tracks

  As a user
  I want to be able to add tracks to a list and see a list of all my tracks.

  As a user
  I want to be able to search my music by title or by artist.

  As a user
  I want to be able to see a list of tracks that match a keyword

2. Design the Class System
Consider diagramming out the classes and their relationships. Take care to focus on the details you see as important, not everything. The diagram below uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com

┌────────────────────────────┐
│ MusicPlayer                │
│                            │
│ - add(track)               │
│ - all                      │
│ - search(keyword)          │
│   => [tracks...]           │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Track(title, artist)    │
│ - matches?(keyword)     │
│                         │
│                         │
│                         │
│                         │
└─────────────────────────┘
Also design the interface of each class in more detail.

class MusicLibrary
  def initialize
    @music_library = []
  end

  def add(track) # track is an instance of Track
    # Track gets added to the library
    # Returns nothing
    @music_library << track
  end

  def all
    # Returns a list of track objects
    @music_library
  end
  
  def search(keyword) # keyword is a string
    # Returns a list of tracks with tracks that include the keyword
    @music_library.map {|track| track.match?(keyword)}
  end
end

class Track
  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def matches?
    # Returns true keyword
    self.match?(keyword)
  end
end

3. Create Examples as Integration Tests
Create examples of the classes being used together in different situations and combinations that reflect the ways in which the system will be used.

# Music

# Gets all tracks

library = MusicLibrary.new
track_1 = Track.new("", "Veracocha")
library.add(track_1)
library.all # => fails -> "Please, enter a title"

library = MusicLibrary.new
track_1 = Track.new("Can you feel the love tonight?", "")
library.add(track_1)
library.all # => fails -> "Please, enter an artist"

library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]


describe "search behaviour" do

library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
library.add(track_1)
library.search("Blanche") #=> [track_1]

library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
library.add(track_1)
library.search("Whatever") #=> fail "No matches found"

library = MusicLibrary.new
track_1 = Track.new("The killers", "Mr. Brightside")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.search("The") #=> [track_1, track_2]



4. Create Examples as Unit Tests
Create examples, where appropriate, of the behaviour of each relevant class at a more granular level of detail.

# EXAMPLE

# Track
describe "initialize" do
 it "constructs" do
   track_1 = Track.new("my_title", "my_artist")
 end
end

describe "matches?" do
  it "fails if keyword is an empty string" do
  track_1 = Track.new("my_title", "my_artist")
  track_1.matches?("") #=> fail "Give me, give, give me a keyword after midnight"

  it "returns true if the track matches the keyword" do
  track_1 = Track.new("my_title", "my_artist")
  track_1.matches?("title") #=> true

  it "returns false if the track doesn't match the keyword" do
  track_1 = Track.new("my_title", "my_artist")
  track_1.matches?("Snore") #=> false

# MusicLibrary
describe "initialize" do
it "constructs an empty array" do
 music_library = MusicLibrary.new
 music_library.all = []



Encode each example as a test. You can add to the above list as you go.

5. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.