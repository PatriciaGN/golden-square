require_relative "../lib/diaryentry_class.rb"
require_relative "../lib/diary_class.rb"

RSpec.describe DiaryEntry do
    it "#Initialize method" do
        it "Constructs the variables @title and @contents" do
            new_entry = DiaryEntry.new("my_title", "my_contents")
        end
    end
end