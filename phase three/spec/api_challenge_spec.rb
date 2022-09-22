require_relative "../lib/api_challenge.rb"

RSpec.describe CatFacts do
    describe "provide" do
        it "provides a cat fact" do
            fake_requester = double :fake_requester
            allow(fake_requester).to receive(:get).with(URI("https://catfact.ninja/fact")).and_return'{"fact":"According to Hebrew legend, Noah prayed to God for help protecting all the food he stored on the ark from being eaten by rats. In reply, God made the lion sneeze, and out popped a cat.","length":184}'
            cat_fact = CatFacts.new(fake_requester)
            expect(cat_fact.provide).to eq "Cat fact: According to Hebrew legend, Noah prayed to God for help protecting all the food he stored on the ark from being eaten by rats. In reply, God made the lion sneeze, and out popped a cat."
        end
    end
end