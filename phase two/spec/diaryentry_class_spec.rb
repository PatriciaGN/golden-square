require_relative "../lib/diaryentry_class.rb"
require_relative "../lib/diary_class.rb"

RSpec.describe DiaryEntry do
    it "#Initialize + #title + #contents" do
        it "Constructs the variables @title and @contents" do
            new_entry = DiaryEntry.new("my_title", "my_contents")
        end

        it "Returns the title" do
            new_entry = DiaryEntry.new("my_title", "my_contents")
            expect (new_entry.title).to eq "my_title"
        end
    end
end