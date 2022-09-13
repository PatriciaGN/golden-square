require "greet"

RSpec.describe "greet" do
  it "returns Hello name of user" do
    result = greet("Ruby")
    expect(result).to eq "Hello, Ruby!"
  end
end