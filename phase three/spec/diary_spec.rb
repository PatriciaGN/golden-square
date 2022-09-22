require_relative "../lib/diary.rb"

RSpec.describe Diary do
  describe "#read" do
    it "returns the contents of the diary" do
        my_diary = Diary.new("contents")
        expect(my_diary.read).to eq "contents"
    end
  end
end