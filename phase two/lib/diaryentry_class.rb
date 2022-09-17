

class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @counter = 0
    end
  
    def title
       @title
    end
  
    def contents
       @contents
    end
  
    def count_words
      @contents.split(" ").count
    end
  
    def reading_time(wpm) # wpm is an integer representing
                          # the number of words the user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
      fail "The reading speed is too low!" if wpm < 1
      (count_words / wpm.to_f).ceil 
    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
      total_words_readable = wpm * minutes
      last_word = @counter + total_words_readable
      chunk = @contents.split[@counter...last_word]
      if last_word >= count_words
          @counter = 0
      else
          @counter = last_word
      end
      return chunk.join(" ")
    end
  end
