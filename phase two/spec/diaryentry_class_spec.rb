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

      describe "#reading_time" do
        it "raises an error if wpm lower than 1" do
          new_entry = DiaryEntry.new("my_title", "My contents")
          expect { new_entry.reading_time(0) }.to raise_error "The reading speed is too low!"
        end

        it "it returns zero when given an empty string" do
           new_entry = DiaryEntry.new(nil, "")
           expect(new_entry.reading_time(200)).to eq 0
        end
 
        it "it returns the number of minutes it takes to read a text rounded up" do
           new_entry = DiaryEntry.new(nil, "one")
           expect(new_entry.reading_time(200)).to eq 1
        end
 
        it "it returns the number of minutes it takes to read a text rounded up" do
           new_entry = DiaryEntry.new(nil, "one " * 200)
           expect(new_entry.reading_time(200)).to eq 1
        end
 
        it "it returns the number of minutes it takes to read a text rounded up" do
           my_diary = DiaryEntry.new(nil, "one " * 300)
           expect(my_diary.reading_time(200)).to eq 2
        end
     end

     describe "#reading_chunk" do
        it "returns a string with the number of words a user can read read in a given time" do
          new_entry = DiaryEntry.new(nil, "one two three four five six seven eight nine ten") 
          expect(new_entry.reading_chunk(2, 3)).to eq "one two three four five six"
        end
  
        it "returns the text the user is able to read starting from the previous chunk" do
          new_entry = DiaryEntry.new(nil, "one two three four five six seven eight nine ten")
          new_entry.reading_chunk(2, 2) 
          expect(new_entry.reading_chunk(2, 2)).to eq "five six seven eight"
        end
  
        it "stops returning words when it gets to the end of the string" do
          new_entry = DiaryEntry.new(nil, "one two three four five six seven eight nine ten")
          expect(new_entry.reading_chunk(5, 3)).to eq "one two three four five six seven eight nine ten"
        end
  
        it "starts returning the contents again after it has gotten to the end when called several times" do
          new_entry = DiaryEntry.new(nil, "one two three four five six seven eight nine ten")
          new_entry.reading_chunk(5, 3)
          expect(new_entry.reading_chunk(1, 2)).to eq "one two"
        end
    end
end