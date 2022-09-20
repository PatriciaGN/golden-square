require_relative "../lib/diaryentry_class.rb"

describe DiaryEntry do
  describe "#read_entry" do
    it "creates an instance of the DiaryEntry class with a title and contents and displays it to the user" do
        entry1 = DiaryEntry.new("Monday", "two words")
        expect(entry1.read_entry).to eq "Monday: two words"
    end 
  end

  describe "#count words" do
    it "returns the number of words of the contents in a given entry as an integer" do
      entry1 = DiaryEntry.new("Monday", "two words")
      expect(entry1.count_words).to eq 2
    end
  end
end