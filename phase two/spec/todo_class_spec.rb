require_relative "../lib/todo_class.rb"

RSpec.describe "Todo" do
    describe "#initialize" do
        it "constructs an empty array and stores it in the variable @tasks" do
            my_todo = Todo.new("Wash up")
        end
    end

    describe "#task" do
      it "returns an empty string if todo is empty" do
        my_todo = Todo.new("")
        expect(my_todo.task).to eq ""
      end
    end

    describe "#mark_done!" do
      it "returns an error if a todo was already done" do
        my_todo = Todo.new("Wash up")
        my_todo.mark_done!
        expect { my_todo.mark_done! }.to raise_error "That todo was already marked as done"
      end
    end
end