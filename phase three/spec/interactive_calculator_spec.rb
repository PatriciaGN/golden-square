require_relative "../lib/interactive_calculator.rb"

RSpec.describe InteractiveCalculator do
    describe "#run" do
        it "prints a formatted string with a substraction of the two numbers given" do
            io = double :io
            expect(io).to receive(:puts).with("Hello. I will subtract two numbers.")
            expect(io).to receive(:puts).with("Please enter a number")
            expect(io).to receive(:gets).and_return("4")
            expect(io).to receive(:puts).with("Please enter another number")
            expect(io).to receive(:gets).and_return("2")
            expect(io).to receive(:puts).with("Here is your result:")
            expect(io).to receive(:puts).with("4 - 2 = 2")

            interactive_calculator = InteractiveCalculator.new(io)
            interactive_calculator.run
        end
    end
end