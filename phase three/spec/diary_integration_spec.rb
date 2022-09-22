require_relative "../lib/diary.rb"
require_relative "../lib/secret_diary.rb"

RSpec.describe "integration" do
    it "can't read the diary when it is locked" do
        my_diary = Diary.new("contents")
        secret_diary = SecretDiary.new(my_diary)
        expect { secret_diary.read }.to raise_error "Go away!"
    end

    it "reads the diary contents when it is unlocked" do
        my_diary = Diary.new("contents")
        secret_diary = SecretDiary.new(my_diary)
        secret_diary.unlock
        expect(secret_diary.read).to eq "contents"
    end

    it "can't read the diary when it is unlocked and relocked" do
        my_diary = Diary.new("contents")
        secret_diary = SecretDiary.new(my_diary)
        secret_diary.unlock
        secret_diary.lock
        expect { secret_diary.read }.to raise_error "Go away!"
    end

end