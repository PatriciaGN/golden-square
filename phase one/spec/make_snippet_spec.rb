require "make_snippet.rb"

RSpec.describe "tests number of words" do 
    it "checks if 5 words and ... returned" do
        result = make_snippet("the and it dog cat fish")
        expect(result).to eq "the and it dog cat..."
    end
end

RSpec.describe "tests number of words" do 
    it "print phrase if < 5 words" do
        result = make_snippet("the and it")
        expect(result).to eq "the and it"
    end
end







