require_relative "../lib/grammar_stats_class.rb"

RSpec.describe GrammarStats do
  describe "#check" do
    it "returns false if text is an empty string" do
        grammar = GrammarStats.new
        expect(grammar.check("")).to eq false
    end

    it "returns true if text is a grammatically correct string" do
        grammar = GrammarStats.new
        expect(grammar.check("One.")).to eq true
    end

    it "returns false if text is a grammatically incorrect string" do
        grammar = GrammarStats.new
        expect(grammar.check("One")).to eq false
    end

    it "returns true if text is a grammatically correct string with uppercase" do
        grammar = GrammarStats.new
        expect(grammar.check("ONE.")).to eq true
    end
  end

  describe "#percentage_good" do
    it "fails" do
        grammar = GrammarStats.new
        expect { grammar.percentage_good }.to raise_error "No texts have been introduced"
    end

    it "returns 100 if all attempts passed" do
       grammar = GrammarStats.new
       grammar.check("One.")
       expect(grammar.percentage_good).to eq 100 
    end
    
    it "returns 50 if half of the attempts passed" do
        grammar = GrammarStats.new
        grammar.check("One.")
        grammar.check("two")
        expect(grammar.percentage_good).to eq 50
     end
     
     it "returns 33 if one third of the attempts passed" do
        grammar = GrammarStats.new
        grammar.check("One.")
        grammar.check("two")
        grammar.check("three")
        expect(grammar.percentage_good).to eq 33
     end
    
  end
end