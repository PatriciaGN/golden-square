1. Describe the Problem
As a user
I want to be able to record text into my diary.
Be able to see the title and all the contents I have written on my diary.
Get an ceiled estimation of how long it takes to read all the entries.
Be able to get a chunk of text that I can read in a certain amount of minutes with my reading speed and be able to keep reading small chunks until I finish all the contents.

2. Design the Class Interface
Name: DiaryEntry
Initialize takes two parameters:
  title - A string containing the title of each piece of contents.
  contents - A string with the contents equivalent to an entry.

**Methods**
* title: Doesn't take any arguments, returns @title. No side effects.

* contents: Doesn't take any arguments, returns @contents. No side effects.

* count_words: Doesn't take any arguments, returns an integer (total_words) which is the number of words in the contents.

* reading_time(wpm): wpm - integer representing the number of words a user can read in a minute.
Returns an integer which equals the minutes the user will take to read all the entries in the diary (rounded up).

* reading_chunk (wpm, minutes): wpm - integer representing the number of words the user can read per minute.
  minutes - Minutes the user have available to read at a certain time.
  Returns a string (chunk) that the user can read in a given time. If called again, the chunk will start from the word after the last word from the previous chunk. When it reaches the end, it starts from the beginning.



3. Create Examples as Tests
* Initialize + title + contents
  it "Constructs the variarbles @title and @contents" do
    diary_entry = DiaryEntry.new("my_title", "my contents")

  it "Creates the variables @title and @contents and displays them" do
    diary_entry = DiaryEntry.new("my_title", "my contents")
    diary_entry.title should equal "my_title"
    diary_entry.contents should equal "my contents"

* count_words
  it "Returns 0 if contents are an empty string"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "")
    diary_entry.count_words should equal 0

  it "Returns 2 if contents are a 2 words string"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "My contents")
    diary_entry.count_words should equal 2

  it "Returns 4 if contents are a 4 words string"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "My contents are cool")
    diary_entry.count_words should equal 4

* reading_time(wpm)
   it "raises an error if wpm lower than 1"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "My contents")
    diary_entry.reading_time(0) should equal "The reading speed is too low!"

   it "returns 0 if contents is an empty string"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "")
    diary_entry.reading_time(1) should equal 0

   it "returns 1 when wpm is 1 and contents have one word"
     diary_entry = DiaryEntry.new
     diary_entry("my_title", "Contents")
     diary_entry.reading_time(1) should equal 1

   it "returns 3 when wpm is 2 and contents have six words"
     diary_entry = DiaryEntry.new
     diary_entry("my_title", "These contents do have six words")
     diary_entry.reading_time(2) should equal 3

* reading_chunk(wpm, minutes)
   it "raises an error if wpm is 0"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "My contents")
    diary_entry.reading_chunk(0, 1) should equal "The reading speed is too low!"

   it "raises an error if minutes is 0"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "My contents")
    diary_entry.reading_chunk(1, 0) should equal "There is no time to read anything!"

   it "returns one word if wpm and minutes equal one"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "One two three four")
    diary_entry.reading_chunk(1, 1) should equal "One"

   it "returns four words if wpm and minutes equal 2"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "One two three four five six")
    diary_entry.reading_chunk(2, 2) should equal "One two three four"

   it "when called twice, the second chunk starts from after the first one"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "One two three four five six seven eight")
    diary_entry.reading_chunk(2, 2) 
    diary_entry.reading_chunk(2, 2) should equal "five six seven eight"

   it "if when called it reaches the end of the text, the next time it returns a chunk starting from the beginning"
    diary_entry = DiaryEntry.new
    diary_entry("my_title", "One two three four five six")
    diary_entry.reading_chunk(2, 3) 
    diary_entry.reading_chunk(2, 1) should equal "One two"


4. Implement the Behaviour
For each example you create as a test, implement the behaviour that allows the class to behave according to your example.
At this point you may wish to apply small-step test-driving to manage the complexity. This means you only write the minimum lines of the example to get the test to fail (red), then make it pass (green) and refactor, before adding another line to the test until it fails, then continue.
Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.
Copy and fill out this template for each of the below exercises.
