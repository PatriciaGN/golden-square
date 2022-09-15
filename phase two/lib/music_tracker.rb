# name: MusicTracker
# Initializer: @tracks_list = []
# Methods: 
# * add_track(string) - It would add the string to the tracks_list array. It doesn't return anything
# * show_list() - It would return the strings stored in tracks_list. No side effects.

class MusicTracker
    def initialize
        @tracks_list = []
    end

    def add_track(track)
        fail "Please, give me a track!" if track == ""
        @tracks_list << track
    end

    def show_list
        fail "The list is empty" if @tracks_list.empty?
        @tracks_list.join("\n")
    end
end