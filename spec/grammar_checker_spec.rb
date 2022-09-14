require "grammar_checker"

# grammar_checker(“”) throws an error
# grammar_checker(6) throws an error
# grammar_checker(“Hello world”) => false
# grammar_checker(“Cats are cool.”) => true
# grammar_checker(“dogs are also fine.”) => false
# grammar_checker(“MMmmmm, maybe?” => true
# grammar_checker(“PROGRAMING IS FUN!” => true
# grammar_checker(“For example:”) => false

RSpec.describe "grammar_checker" do
    context "when given an empty string" do
        it "fails" do
            expect { grammar_checker("")}.to raise_error "Please, give me some text!"
        end
    end
end