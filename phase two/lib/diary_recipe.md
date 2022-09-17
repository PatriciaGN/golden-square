1. Describe the Problem
As a user
I want to be able to record text into my diary.
Get an estimation of how long it takes to read an entry.
Get an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they have available given their reading speed.

2. Design the Class Interface
Name: Diary
Initialize takes no parameters and creates an empty array called "@entries"

**Methods**
* initialize: creates an variable (@entries) that contains an empty array.

* add(entry): Takes a instance of the class DiaryEntry (entry) and adds it to our @entries array. Doesn't return anything.

* all: Doesn't take any arguments, returns a list of instances of DiaryEntry. No side effects.

* count_words: Doesn't take any arguments, returns an integer (total_words) which is the number of words inside all entries in our diary (needs to use count_words method from DiaryEntry).

* reading_time(wpm): wpm - integer representing the number of words a user can read in a minute.
Returns an integer which equals the minutes the user will take to read all the entries in the diary (rounded up).

* find_best_entry_for_reading_time(wpm, minutes):
wpm - integer representing the number of words a user can read in a minute.
minutes - is an integer representing the number of minutes the user
 has to read.
 It returns an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they have available given their reading speed.

3. Create Examples as Tests
* Initialize
  it "Constructs the variable @entries which equals an empty array" do
    new_entry1 = Diary.new
    # new_entry1.all should equal an empty array.

* add(entry) 
 In integration recipe

* all
Tested on the previous tests

* count_words
  In integration recipe

* find_best_entry_for_reading_time(wpm, minutes)
  In integration recipe



4. Implement the Behaviour
For each example you create as a test, implement the behaviour that allows the class to behave according to your example.
At this point you may wish to apply small-step test-driving to manage the complexity. This means you only write the minimum lines of the example to get the test to fail (red), then make it pass (green) and refactor, before adding another line to the test until it fails, then continue.
Then return to step 3 until you have addressed the problem you were given. You may also need to revise your design, for example if you realise you made a mistake earlier.
Copy and fill out this template for each of the below exercises.

