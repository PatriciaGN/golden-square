require "todo_checker.rb"
=begin
todo_checker(“”) throws an error
todo_checker(6) throws an error
todo_checker(“This string”) => false
todo_checker(“Another string TODO”) => true
todo_checker(“So many TODO TODO in this string”) => true
todo_checker(“This string has a lowercase todo”) => false
todo_checker(“UPPERCASE STRING”) => false
todo_checker(“UPPERCASE TODO”) => true
=end

RSpec.describe "todo_checker method" do
    context "when given an integer" do
        it "fails" do
            expect { todo_checker(6) }.to raise_error "Please, give me a string!"
        end
    end
end

RSpec.describe "todo_checker method" do
    context "when given an empty string" do
        it "fails" do
            expect { todo_checker("") }.to raise_error "Please, give me some text!"
        end
    end
end

RSpec.describe "todo_checker method" do
    it "returns false when given 'This string'" do
        result = todo_checker("This string")
        expect(result).to eq false
    end
end

RSpec.describe "todo_checker method" do
    it "returns true when given 'Another string TODO'" do
        result = todo_checker("Another string TODO")
        expect(result).to eq true
    end
end

RSpec.describe "todo_checker method" do
    it "returns true when given 'So many TODO TODO in this string'" do
        result = todo_checker("So many TODO TODO in this string")
        expect(result).to eq true
    end
end

RSpec.describe "todo_checker method" do
    it "returns false when given 'This string has a lowercase todo'" do
        result = todo_checker("This string has a lowercase todo")
        expect(result).to eq false
    end
end

RSpec.describe "todo_checker method" do
    it "returns false when given 'UPPERCASE STRING'" do
        result = todo_checker("UPPERCASE STRING")
        expect(result).to eq false
    end
end

RSpec.describe "todo_checker method" do
    it "returns true when given 'UPPERCASE TODO'" do
        result = todo_checker("UPPERCASE TODO")
        expect(result).to eq true
    end
end