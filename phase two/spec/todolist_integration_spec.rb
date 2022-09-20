   require_relative "../lib/todolist_class.rb"
   require_relative "../lib/todo_class.rb"
   
   RSpec.describe "TodoList integration" do
    describe "#add(todo) + #incomplete"  do
      it "marks a todo as incomplete" do
        my_todo = Todo.new("Wash up")
        my_list = TodoList.new
        my_list.add(my_todo)
        expect(my_list.incomplete).to eq [my_todo]
      end

      it "returns an empty list if no todos added" do
        my_list = TodoList.new
        my_todo = Todo.new("Wash up")
        expect(my_list.incomplete).to eq []
      end
 
      it "returns several incompleted todos" do
        my_todo1 = Todo.new("Wash up")
        my_todo2 = Todo.new("Pet the cat")
        my_list = TodoList.new
        my_list.add(my_todo1)
        my_list.add(my_todo2)
        expect(my_list.incomplete).to eq [my_todo1, my_todo2]
      end

    end

    describe "#add(todo) + #mark_done! + #complete" do
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

      it "when marked a task as complete, it doesn't appear on the incomplete list" do
        my_list = TodoList.new
        my_todo1 = Todo.new("Wash up")
        my_todo2 = Todo.new("Pet the cat")
        my_list.add(my_todo1)
        my_list.add(my_todo2)
        my_todo1.mark_done!
        expect(my_list.incomplete).to eq [my_todo2]
      end

      it "marks several todos as done and returns the list" do
        my_list = TodoList.new
        my_todo1 = Todo.new("Wash up")
        my_todo2 = Todo.new("Take mail")
        my_list.add(my_todo1)
        my_list.add(my_todo2)
        my_todo1.mark_done!
        my_todo2.mark_done!
        expect(my_list.complete).to eq [my_todo1, my_todo2]
      end
    end

    describe "#add(todo) + #mark_done! + #complete + #incomplete + #done?" do
      it "returns true if a todo has been done" do
        my_list = TodoList.new
        my_todo = Todo.new("Wash up")
        my_list.add(my_todo)
        my_todo.mark_done!
        expect(my_todo.done?).to eq true
      end

      it "returns false if a todo hasn't been done" do
        my_list = TodoList.new
        my_todo = Todo.new("Wash up")
        my_list.add(my_todo)
        expect(my_todo.done?).to eq false
      end
    end

    describe "#add(todo) + #mark_done! + #complete + #incomplete + #done? + give_up!" do
      it "marks all todos as done when one todo in list and returns that todo" do
        my_list = TodoList.new
        my_todo1 = Todo.new("Wash up")
        my_list.add(my_todo1)
        my_list.give_up!
        expect(my_list.complete).to eq [my_todo1]
      end

      it "marks all todos as done and returns the list of completed todos" do
        my_list = TodoList.new
        my_todo1 = Todo.new("Wash up")
        my_todo2 = Todo.new("Take mail")
        my_list.add(my_todo1)
        my_list.add(my_todo2)
        my_list.give_up!
        expect(my_list.complete).to eq [my_todo1, my_todo2]
      end
    end
  end