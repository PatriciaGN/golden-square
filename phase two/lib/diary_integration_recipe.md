1. Describe the Problem
As a user
I want to be able to record text into my diary.
Get an estimation of how long it takes to read an entry.
Be able to see the title and all the contents I have written on my diary.
Get an ceiled estimation of how long it takes to read all the entries.
Be able to get a chunk of text that I can read in a certain amount of minutes with my reading speed and be able to keep reading small chunks until I finish all the contents.
Get an instance of diary entry representing the entry that is closest to, but not over, the length that the user could read in the minutes they have available given their reading speed.


**class Diary**

* Initialize for both methods + add (Diary) + all (Diary)
 it "adds an entry to the @entries array and returns it as an instance of the DiaryEntry class"
  new_entry = DiaryEntry.new("My title", "My contents")
  my_diary = Diary.new
  my_diary.add(new_entry)
  new_entry1.all should equal [ new_entry ]

  it "adds several entries to the @entries array and returns them as an array and returns them as an array of instances of the DiaryEntry class"
  new_entry1 = DiaryEntry.new("My title1", "My contents1")
  new_entry2 = DiaryEntry.new("My title2", "My contents2")
  my_diary = Diary.new
  my_diary.add(new_entry1)
  my_diary.add(new_entry2)
  my_diary.all should equal [ new_entry1, new_entry2 ]

* initialize in both classes, count_words from both classes
  it "Returns zero when no diary entries"
  my_diary = Diary.new
  expect(new_entry1.count_words).to eq 0

  it "Returns the number of words in one diary entry"
  diary_entry1 = DiaryEntry.new("entry_one", "my contents")
  my_diary = Diary.new
  my_diary.add(diary_entry1)
  diary_entry1.count_words
  expect(my_diary.count_words).to eq 2

  it "Returns the number of words in all diary entries"
  diary_entry1 = DiaryEntry.new("entry_one", "my contents one")
  diary_entry2 = DiaryEntry.new("entry_two", "my contents two")
  diary_entry1.count_words
  diary_entry2.count_words
  my_diary = Diary.new
  my_diary.add(diary_entry1)
  my_diary.add(diary_entry2)
  expect(my_diary.count_words).to eq 6

  * Count_words in both classes, initialize in both classes, add (Diary), find_best_entry_for_reading_time (Diary)
  it "fails when there are no entries in the diary"
  my_diary = Diary.new
  expect{ my_diary.find_best_entry_for_reading_time(1, 1) }.to raise_error "No entries found"

  it "fails when all entries are too long"
  new_entry1 = DiaryEntry.new("My title1", "My contents one")
  new_entry2 = DiaryEntry.new("My title2", "My contents two")
  my_diary = Diary.new
  my_diary.add(new_entry1)
  my_diary.add(new_entry2)
  expect{ my_diary.find_best_entry_for_reading_time(1, 2) }.to raise_error "All entries are too long to read in the given time."

  it "Returns an instance of diary entry the user can read"
    new_entry1 = DiaryEntry.new("My title1", "My contents one")
    my_diary = Diary.new
    my_diary.add(new_entry1)
    expect my_diary.find_best_entry_for_reading_time(1, 2) to equal new_entry1

    it "Returns an instance of diary entry of the entry that is equal or closest below to the amount of words the user can read"
    new_entry1 = DiaryEntry.new("My title1", "My contents")
    new_entry2 = DiaryEntry.new("My title2", "My contents two")
    my_diary = Diary.new
    my_diary.add(new_entry1)
    my_diary.add(new_entry2)
    expect my_diary.find_best_entry_for_reading_time(1, 2) to equal new_entry1

  it "When there are two entries with same amount of words that the user can read, it returns both of them"
    new_entry1 = DiaryEntry.new("My title1", "My contents one")
    new_entry2 = DiaryEntry.new("My title2", "My contents two")
    my_diary = Diary.new
    my_diary.add(new_entry1)
    my_diary.add(new_entry2)
    expect my_diary.find_best_entry_for_reading_time(1, 2) to equal new_entry1, new_entry2