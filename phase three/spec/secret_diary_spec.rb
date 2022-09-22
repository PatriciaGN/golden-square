require_relative "../lib/secret_diary.rb"

RSpec.describe SecretDiary do
    describe "#read" do
        it "does not read the diary because it is initially locked" do
            my_diary = double :diary
            secret_diary = SecretDiary.new(my_diary)
            expect { secret_diary.read }.to raise_error "Go away!"
        end
       
        it "reads the diary contents when it is unlocked" do
            my_diary = (double :diary, read: "contents")
            secret_diary = SecretDiary.new(my_diary)
            secret_diary.unlock
            my_diary.read
            expect(secret_diary.read).to eq "contents"
        end

        it "can't read the diary when it is unlocked and relocked" do
            my_diary = double :diary
            secret_diary = SecretDiary.new(my_diary)
            secret_diary.unlock
            secret_diary.lock
            expect { secret_diary.read }.to raise_error "Go away!"
        end
    end
end