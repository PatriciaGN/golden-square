class DiaryEntry

    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @counter = 0
    end
  
    def title
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
        @contents.split(" ").count
    end
  
    def reading_time(wpm) # wpm is an integer representing the number of words the
      (count_words / wpm.to_f).ceil                # user can read per minute words / reading_time(minutes) = wpm
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
    end
  
    def reading_chunk(wpm, minutes)
        total_words = wpm * minutes
        last_word = @counter + total_words 
        chunk = @contents.split[@counter...last_word]
        if last_word >= count_words
            @counter = 0
        else
            @counter = last_word
        end
        return chunk.join(" ")

        
        # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    end


  end
  my_diary = DiaryEntry.new(nil, "one two three four five six seven eight nine ten")
  puts my_diary.reading_chunk(5, 3)
  puts my_diary.reading_chunk(1, 2)