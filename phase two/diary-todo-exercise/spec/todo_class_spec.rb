require_relative "../lib/todo_class.rb"

describe Todo do
  describe "#Initialize" do
    it "constructs the variable @todo that contains a string" do
        todo1 = Todo.new("Buy bananas")
    end
  end 
 end
