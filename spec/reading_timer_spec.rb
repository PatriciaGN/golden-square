# reading_timer(“Hello world”) => 0.0666
# reading_timer(“"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.”) => 2.299
# reading_timer(“”) => 0.0
# reading_timer(6) => throws an error
# readint_timer(nil) => throws an error


RSpec.describe "reading_timer method" do
    context "when given anything other than a string" do
        it "fails" do
            expect { reading_timer(7) }.to raise_error "Please, give me a string!"
        end
    end
end
        

