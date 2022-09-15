require_relative "../lib/diary_entry_class.rb"

RSpec.describe DiaryEntry do
    it "returns a title as a string" do
        my_diary = DiaryEntry.new("September", nil)
        expect(my_diary.title).to eq "September"
    end
end