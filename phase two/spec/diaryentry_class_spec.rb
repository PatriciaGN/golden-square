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
    end
end