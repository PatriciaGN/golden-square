   require_relative "../lib/todolist_class.rb"
   require_relative "../lib/todo_class.rb"
   
   RSpec.describe "TodoList integration" do
    describe "#add(todo) + #incomplete"  do
      it "adds a todo to the incomplete list" do
        my_todo = Todo.new("Wash up")
        my_list = TodoList.new
        my_list.add(my_todo)
        expect(my_list.incomplete).to eq [my_todo]
      end

      it "returns an empty list if no todos done" do
        my_list = TodoList.new
        my_todo = Todo.new("Wash up")
        expect(my_list.incomplete).to eq []
      end
    end

    describe "#add(todo) + #mark_done! + #complete + #incomplete + #done? + give_up!" do
      it "returns an error if a todo was already done" do
        my_todo = Todo.new("Wash up")
        my_list = TodoList.new
        my_list.add(my_todo)
        my_todo.mark_done!
        expect { my_todo.mark_done! }.to raise_error "That todo was already marked as done"
      end
      
      it "marks a todo as done and returns the list of todos done" do
        my_list = TodoList.new
        my_todo = Todo.new("Wash up")
        my_list.add(my_todo)
        my_todo.mark_done!
        expect(my_list.complete).to eq [my_todo]
      end
    end
  end