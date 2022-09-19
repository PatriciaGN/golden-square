require_relative "../lib/diary_class.rb"
require_relative "../lib/diaryentry_class.rb"

RSpec.describe Diary do
    describe "#add(entry) and #all" do
        it "adds an entrie to @all_entries" do
            my_diary = Diary.new
            new_entry = DiaryEntry.new("my title", "my contents")
            my_diary.add(new_entry)
            expect(my_diary.all).to eq [["my title", "my contents"]]
        end
    end
end