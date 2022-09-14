# reading_timer(one_word) => 1
# reading_timer(ten_words) => 1
# reading_timer(300_words) => 2 
# reading_timer(“”) => 0
# reading_timer(6) => throws an error
# readint_timer(nil) => throws an error
require "reading_timer"

RSpec.describe "reading_timer method" do
    context "when given anything other than a string" do
        it "fails" do
            expect { reading_timer(7) }.to raise_error "Please, give me a string!"
        end
    end
end

RSpec.describe "reading_timer method" do
    it "returns 0 when given an empty string" do
        result = reading_timer("")
        expect(result).to eq 0
    end
end

RSpec.describe "reading_timer method" do
    it "returns 1 when given a one word string" do
        result = reading_timer(one_word)
        expect(result).to eq 1
    end
end

