require_relative "../lib/diary_class.rb"
require_relative "../lib/todo_class.rb"
require_relative "../lib/diaryentry_class.rb"


describe "Diary - Todo integration" do
    describe "#add_entry + #display_all_entries" do
      it "returns an empty array if no entries added" do
        my_diary = Diary.new
        expect(my_diary.display_all_entries).to eq []
      end

      it "adds an entry to @all_entries and displays it" do
        my_diary = Diary.new
        entry1 = DiaryEntry.new("Monday", "one")
        my_diary.add_entry(entry1)
        expect(my_diary.display_all_entries).to eq [entry1]
      end

      it "adds two entries to @all_entries and displays them" do
        my_diary = Diary.new
        entry1 = DiaryEntry.new("Monday", "one")
        entry2 = DiaryEntry.new("Tuesday", "two")
        my_diary.add_entry(entry1)
        my_diary.add_entry(entry2)
        expect(my_diary.display_all_entries).to eq [entry1, entry2]
      end
    end

    describe "#add_task + #display_all_tasks" do
        it "returns an empty array if no tasks added" do
          my_diary = Diary.new
          expect(my_diary.display_all_tasks).to eq []
        end

        it "returns an array containing one task" do
            my_diary = Diary.new
            task1 = Todo.new("Water the plants")
            my_diary.add_task(task1)
            expect(my_diary.display_all_tasks).to eq [task1]
        end

        it "returns an array containing several tasks" do
            my_diary = Diary.new
            task1 = Todo.new("Water the plants")
            task2 = Todo.new("Go for a walk")
            my_diary.add_task(task1)
            my_diary.add_task(task2)
            expect(my_diary.display_all_tasks).to eq [task1, task2]
        end        
    end

    describe "#best_entry_for_given_time" do
        it "fails if there are no entries the user can read" do
            my_diary = Diary.new
            expect { my_diary.best_entry_for_given_time(1, 2) }.to raise_error "No suitable entries for the time given"
        end

        it "fails if there are no entries the user can read in the given time" do
            my_diary = Diary.new
            entry1 = DiaryEntry.new("Monday", "one two three")
            entry2 = DiaryEntry.new("Tuesday", "five four six")
            my_diary.add_entry(entry1)
            my_diary.add_entry(entry2)
            expect { my_diary.best_entry_for_given_time(1, 2) }.to raise_error "No suitable entries for the time given"
        end
    end

    describe "#best_entry_for_given_time" do
        it "returns an entry the user can read in the given time when only one entry stored" do
            my_diary = Diary.new
            entry1 = DiaryEntry.new("Monday", "one two three")
            my_diary.add_entry(entry1)
            expect(my_diary.best_entry_for_given_time(1, 3)).to eq entry1
        end

        it "returns an entry the user can read in the given time when several entries stored" do
            my_diary = Diary.new
            entry1 = DiaryEntry.new("Monday", "one two three four")
            entry2 = DiaryEntry.new("Tuesday", "five four six")
            my_diary.add_entry(entry1)
            my_diary.add_entry(entry2)
            expect(my_diary.best_entry_for_given_time(1, 3)).to eq entry2
        end
    end

    describe "#phone_list" do
        it "returns an empty list if no phones found in entries" do
            my_diary = Diary.new
            entry1 = DiaryEntry.new("Monday", "one two three four")
            entry2 = DiaryEntry.new("Tuesday", "five four six")
            my_diary.add_entry(entry1)
            my_diary.add_entry(entry2)
            expect(my_diary.phone_list).to eq []
        end

        it "returns the phone numbers found in the contents of one entry as a list" do
            my_diary = Diary.new
            entry1 = DiaryEntry.new("Tuesday", "I went for a walk with my friend, their number was 07575569329")
            my_diary.add_entry(entry1)
            expect(my_diary.phone_list).to eq ["07575569329"]
        end

        it "returns the phone numbers found in the contents of all entries as a list" do
            my_diary = Diary.new
            entry1 = DiaryEntry.new("Tuesday", "I went for a walk with my friend, their number was 07575569329")
            entry2 = DiaryEntry.new("Wednesday", "I met a lot of new people at the board games night, their numbers were: 07575789329, 03434567893 and 02124998844")
            my_diary.add_entry(entry1)
            my_diary.add_entry(entry2)
            expect(my_diary.phone_list).to eq ["07575569329", "07575789329", "03434567893", "02124998844"]
        end
    end
end 