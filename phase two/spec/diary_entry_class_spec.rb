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

       it "it returns the number of minutes it takes to read a text rounded up" do
          my_diary = DiaryEntry.new(nil, "one")
          expect(my_diary.reading_time(200)).to eq 1
       end

       it "it returns the number of minutes it takes to read a text rounded up" do
          my_diary = DiaryEntry.new(nil, "one " * 200)
          expect(my_diary.reading_time(200)).to eq 1
       end

       it "it returns the number of minutes it takes to read a text rounded up" do
          my_diary = DiaryEntry.new(nil, "one " * 300)
          expect(my_diary.reading_time(200)).to eq 2
       end
    end

    describe "#reading_chunk" do
      it "returns a string with the number of words a user can read read in a given time" do
        my_diary = DiaryEntry.new(nil, "one two three four five six seven eight nine ten") 
        expect(my_diary.reading_chunk(2, 3)).to eq "one two three four five six"
      end

      it "returns the text the user is able to read starting from the previous chunk" do
        my_diary = DiaryEntry.new(nil, "one two three four five six seven eight nine ten")
        my_diary.reading_chunk(2, 2) 
        expect(my_diary.reading_chunk(2, 2)).to eq "five six seven eight"
      end

      it "stops returning words when it gets to the end of the string" do
        my_diary = DiaryEntry.new(nil, "one two three four five six seven eight nine ten")
        expect(my_diary.reading_chunk(5, 3)).to eq "one two three four five six seven eight nine ten"
      end

      it "starts returning the contents again after it has gotten to the end when called several times" do
        my_diary = DiaryEntry.new(nil, "one two three four five six seven eight nine ten")
        my_diary.reading_chunk(5, 3)
        expect(my_diary.reading_chunk(1, 2)).to eq "one two"
      end

    end
end