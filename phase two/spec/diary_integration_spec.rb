require_relative "../lib/diary_class.rb"
require_relative "../lib/diaryentry_class.rb"

RSpec.describe Diary do
    describe "#add(entry) and #all" do
        it "adds an entrie to @all_entries" do
            my_diary = Diary.new
            new_entry = DiaryEntry.new("my title", "my contents")
            my_diary.add(new_entry)
            expect(my_diary.all).to eq [new_entry]
        end

        it "adds several entries to the @all_entries array and returns them as an array of instances of the DiaryEntry class" do
          new_entry1 = DiaryEntry.new("My title1", "My contents1")
          new_entry2 = DiaryEntry.new("My title2", "My contents2")
          my_diary = Diary.new
          my_diary.add(new_entry1)
          my_diary.add(new_entry2)
          expect(my_diary.all).to eq [ new_entry1, new_entry2]
        end
    end
    
    describe "#add and #count_words in both classes" do
      it "Returns zero when no diary entries" do
        my_diary = Diary.new
        expect(my_diary.count_words).to eq 0
      end

      it "Returns the number of words in one diary entry" do
        diary_entry1 = DiaryEntry.new("entry_one", "my contents")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        diary_entry1.count_words
        expect(my_diary.count_words).to eq 2
      end

      it "Returns the number of words in several diary entries" do
        diary_entry1 = DiaryEntry.new("entry_one", "my contents one")
        diary_entry2 = DiaryEntry.new("entry_two", "my contents two")
        diary_entry1.count_words
        diary_entry2.count_words
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        my_diary.add(diary_entry2)
        expect(my_diary.count_words).to eq 6
      end
    end
    
    describe "#count_words in both classes, #add (Diary), #reading_time (Diary)" do
      it "fails if reading speed (wpm) is below 1" do
        diary_entry1 = DiaryEntry.new("entry_one", "one")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        expect {my_diary.reading_time(0) }.to raise_error "Reading speed is too low."
      end

      it "returns 0 if no entries are added" do
        my_diary = Diary.new
        expect(my_diary.reading_time(1)).to eq 0
      end

      it "returns 0 if all entries are empty" do
        diary_entry1 = DiaryEntry.new("entry_one", "")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        expect(my_diary.reading_time(1)).to eq 0
      end

      it "returns the estimated reading time of one given entry" do
        diary_entry1 = DiaryEntry.new("entry_one", "one")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        expect(my_diary.reading_time(1)).to eq 1
      end

      it "returns the estimated reading time ceiled of one given entry" do
        diary_entry1 = DiaryEntry.new("entry_one", "one two three")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        expect(my_diary.reading_time(2)).to eq 2
      end

      it "returns the estimated reading time ceiled when given several entries" do
        diary_entry1 = DiaryEntry.new("entry_one", "one two three")
        diary_entry2 = DiaryEntry.new("entry_two", "four five six")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        my_diary.add(diary_entry2)
        expect(my_diary.reading_time(2)).to eq 3
      end
    end

    describe "#find_best_entry_for_reading_time(wpm, minutes)" do
      it "fails when there are no entries" do
        my_diary = Diary.new
        expect { my_diary.find_best_entry_for_reading_time(1, 1) }.to raise_error "There are no entries to read"
      end

      it "fails when no suitable entries for the given time" do
        diary_entry1 = DiaryEntry.new("entry_one", "one two three")
        diary_entry2 = DiaryEntry.new("entry_two", "four five six")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        my_diary.add(diary_entry2)
        expect { my_diary.find_best_entry_for_reading_time(1, 1) }.to raise_error "All entries are too long to read right now"
      end

      it "returns an entry the user can read in the given time" do
        diary_entry1 = DiaryEntry.new("entry_one", "one two three")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        expect(my_diary.find_best_entry_for_reading_time(1, 3)).to eq diary_entry1
      end

      it "returns an entry the user can read in the given time if there are several suitable entries" do
        diary_entry1 = DiaryEntry.new("entry_one", "one two three")
        diary_entry2 = DiaryEntry.new("entry_two", "four five six")
        my_diary = Diary.new
        my_diary.add(diary_entry1)
        my_diary.add(diary_entry2)
        expect(my_diary.find_best_entry_for_reading_time(1, 3)).to eq diary_entry1
      end
    end
end