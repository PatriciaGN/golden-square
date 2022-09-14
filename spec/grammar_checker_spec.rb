require "grammar_checker"

# grammar_checker(“”) throws an error
# grammar_checker(6) throws an error
# grammar_checker(“Hello world”) => false
# grammar_checker(“Cats are cool.”) => true
# grammar_checker(“dogs are also fine.”) => false
# grammar_checker(“MMmmmm, maybe?” => true
# grammar_checker(“PROGRAMING IS FUN!” => true
# grammar_checker(“For example:”) => false

RSpec.describe "grammar_checker method" do
    context "when given an empty string" do
        it "fails" do
            expect { grammar_checker("")}.to raise_error "Please, give me some text!"
        end
    end
end

RSpec.describe "grammar_checker method" do
    context "when given something an integer" do
        it "fails" do
            expect { grammar_checker(6)}.to raise_error "Please, give me a string!"
        end
    end
end

RSpec.describe "grammar_checker method" do
    it "returns false when given the string 'Hello world'" do
        result = grammar_checker("Hello world")
        expect(result).to eq false
    end
end

RSpec.describe "grammar_checker method" do
    it "returns true when given the string 'Cats are cool.'" do
        result = grammar_checker("Cats are cool.")
        expect(result).to eq true
    end
end

RSpec.describe "grammar_checker method" do
    it "returns false when given the string 'dogs are also fine.'" do
        result = grammar_checker("dogs are also fine.")
        expect(result).to eq false
    end
end

RSpec.describe "grammar_checker method" do
    it "returns true when given the string 'MMmmmm, maybe?'" do
        result = grammar_checker("MMmmmm, maybe?")
        expect(result).to eq true
    end
end

RSpec.describe "grammar_checker method" do
    it "returns true when given the string 'PROGRAMING IS FUN!'" do
        result = grammar_checker("PROGRAMING IS FUN!")
        expect(result).to eq true
    end
end

RSpec.describe "grammar_checker method" do
    it "returns false when given the string 'For example:'" do
        result = grammar_checker("For example:")
        expect(result).to eq false
    end
end