require_relative "../lib/diaryentry_class.rb"
require_relative "../lib/diary_class.rb"

RSpec.describe DiaryEntry do
    describe "#initialize + #title + #contents" do
        it "Constructs the variables @title and @contents" do
            new_entry = DiaryEntry.new("my title", "my contents")
        end

        it "returns the title as a string" do
            new_entry = DiaryEntry.new("my title", "my contents")
            expect(new_entry.title).to eq "my title"
        end

        it "returns the content as a string" do
            new_entry = DiaryEntry.new("my title", "my contents")
            expect(new_entry.contents).to eq "my contents"
        end
    end

    describe "#count_words" do 
        it "Returns 0 if contents are an empty string" do
          diary_entry = DiaryEntry.new("my_title", "")
          expect(diary_entry.count_words).to eq 0
        end
        
        it "returns number of words in contents as an integer" do
          diary_entry = DiaryEntry.new("September", "Dear diary")
          expect(diary_entry.count_words).to eq 2
        end

        it "Returns 4 if contents are a 4 words string" do
          diary_entry = DiaryEntry.new("my_title", "My contents are cool")
          expect(diary_entry.count_words).to eq 4
        end
      end
end