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
   
    describe "#count_words" do # the # means it's an instance method
      it "returns number of words in contents as an integer" do
          my_diary = DiaryEntry.new("September", "Dear diary: This is being an amazing month.")
          expect(my_diary.count_words).to eq 8
      end
     
      it "returns 0 if given an empty string" do
        my_diary = DiaryEntry.new("September", "")
        expect(my_diary.count_words).to eq 0
      end
    end

    describe "#reading_time" do
       it "it returns the number of minutes it takes to read a text rounded up" do
          my_diary = DiaryEntry.new(nil, "")
          expect(my_diary.reading_time(200)).to eq 0
       end
    end

end