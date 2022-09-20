require_relative "../lib/diary_class.rb"

describe Diary do
  describe "#Initialize" do
    it "constructs the variables @all_entries and @all_tasks that contains an empty array" do
      my_diary = Diary.new
    end
  end 
 end