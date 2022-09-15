require_relative "../lib/diary_entry_class.rb"

RSpec.describe DiaryEntry do
    it "returns a title as a string" do
        my_diary = DiaryEntry.new("September", nil)
        expect(my_diary.title).to eq "September"
    end

    it "returns the content as a string" do
        my_diary = DiaryEntry.new("September", "Dear diary: This is being an amazing month.")
        expect(my_diary.contents).to eq "Dear diary: This is being an amazing month."
    end

    it "counts the words in contents and returns it as an integer" do
        my_diary = DiaryEntry.new("September", "Dear diary: This is being an amazing month.")
        expect(my_diary.count_words).to eq 8
    end
    
end