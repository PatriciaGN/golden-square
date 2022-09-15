# Method add_track
# Test 1
# Raises an error if given an empty string as argument.
# add_track("") => fail

# Method show_list
# test 1
# Raises an error if list is empty

# Test 2
# Returns one element if tracks_list only contains one element

# Test 3
# # Returns a string with the two elements formatted with a new line"
require_relative "../lib/music_tracker.rb"

RSpec.describe MusicTracker do
    describe "#add_track" do
        it "Raises an error if given an empty string as argument" do
            tracks = MusicTracker.new
            expect { tracks.add_track("") }.to raise_error "Please, give me a track!"
        end
    end

    describe "#show_list" do
        it "Raises an error if list is empty" do
            tracks = MusicTracker.new
            expect { tracks.show_list }.to raise_error "The list is empty"
        end

        it "Returns one element if tracks_list only contains one element" do
            tracks = MusicTracker.new
            tracks.add_track("Wake me up when September ends")
            expect(tracks.show_list).to eq "Wake me up when September ends"
        end

        it "Returns a string with the two elements formatted with a new line" do
            tracks = MusicTracker.new
            tracks.add_track("Wake me up when September ends")
            tracks.add_track("The trooper")
            expect(tracks.show_list).to eq "Wake me up when September ends\nThe trooper"
        end

    end
end