require "io_challenge"

RSpec.describe StringRepeater do
    describe "#run" do
        it "runs" do
            io = double :io
            expect(io).to receive(:puts).with("Hello. I will repeat a string many times.")
            expect(io).to receive(:puts).with("Please enter a string")
            expect(io).to receive(:gets).and_return("cat")
            expect(io).to receive(:puts).with("Please enter a number of repeats")
            expect(io).to receive(:gets).and_return("2")
            expect(io).to receive(:puts).with("Here is your result:")
            expect(io).to receive(:puts).with("catcat")

            string_repeater = StringRepeater.new(io)
            string_repeater.run
        end
    end
end
