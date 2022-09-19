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
end