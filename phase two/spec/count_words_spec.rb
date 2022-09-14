require "count_words.rb"

RSpec.describe "count_words method" do
    it "returns the number of words" do
        result = count_words("cat dog fish")
        expect(result).to eq 3
    end
end