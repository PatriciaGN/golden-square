# File: lib/diary.rb
class Diary
    def initialize
        @all_entries = []
    end
  
    def add(entry) # entry is an instance of DiaryEntry
      # Returns nothing
      @all_entries << entry
    end
  
    def all
      # Returns a list of instances of DiaryEntry
      @all_entries
    end
  
    def count_words
      # Returns the number of words in all diary entries
      # HINT: This method should make use of the `count_words` method on DiaryEntry.
      return 0 if @all_entries.empty?
      total_words = 0
      @all_entries.each { |entry| total_words += entry.count_words }
      return total_words
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # if the user were to read all entries in the diary.
      fail "Reading speed is too low." if wpm < 1
     (self.count_words / wpm.to_f).ceil
    #   total_reading_time = 0
    #   @all_entries.each { |entry| total_reading_time += (entry.count_words / wpm.to_f).ceil }
    #   return total_reading_time
    end
  
    def find_best_entry_for_reading_time(wpm, minutes)
          # `wpm` is an integer representing the number of words the user can read
          # per minute.
          # `minutes` is an integer representing the number of minutes the user
          # has to read.
      # Returns an instance of diary entry representing the entry that is closest 
      # to, but not over, the length that the user could read in the minutes they
      # have available given their reading speed.
      fail "There are no entries to read" if @all_entries.empty?
      words_able_to_read = wpm * minutes
      something_readable = false
      @all_entries.each do |entry|
        if words_able_to_read >= entry.count_words 
          something_readable = true
          return entry 
        end
      end
      fail "All entries are too long to read right now" if something_readable == false
    end
  end