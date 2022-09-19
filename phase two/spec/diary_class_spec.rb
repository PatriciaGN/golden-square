require_relative "../lib/diary_class.rb"

RSpec.describe Diary do
    describe "#initialize" do
        it "creates an empty array and stores it in the variable @all_entries" do
            my_diary = Diary.new
        end
    end
end