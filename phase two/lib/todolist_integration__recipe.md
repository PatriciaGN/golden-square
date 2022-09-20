* add(todo)
it "raises an error if todo doesn't exist"
  my_list = TodoList.new
  expect {my_list.add(notodo)}.to raise_error "That todo doesn't exist"

* add + mark_done! + complete + incomplete + done? + give up!
returns an error if a todo was already done
my_todo = Todo.new("Wash up")
        my_list = TodoList.new
        my_list.add(my_todo)
        my_todo.mark_done!
        my_todo.mark_done!
        expect { my_todo.mark_done! }.to raise_error "That todo was already done" 

it returns an empty list if no todos done
 my_list = TodoList.new
 my_todo = Todo.new("Wash up")
 my_list.add(my_todo)
   #=> my_list.complete = []

it marks a todo as done and returns the list
 my_list = TodoList.new
 my_todo = Todo.new("Wash up")
 my_list.add(my_todo)
 my_todo.mark_done!
   #=> my_list.complete = ["Wash up"]

it marks several todos as done and returns the list
  my_list = TodoList.new
  my_todo1 = Todo.new("Wash up")
  my_todo2 = Todo.new("Take mail")
  my_list.add(my_todo1)
  my_list.add(my_todo2)
  my_todo1.mark_done!
  my_todo2.mark_done!
   #=> my_list.complete = ["Wash up", "Take mail"]

it returns true if a todo has been done
  my_list = TodoList.new
  my_todo = Todo.new("Wash up")
  my_list.add(my_todo)
  my_todo.mark_done!
  my_todo.done? #=> true

it returns false if a todo hasn't been done
  my_list = TodoList.new
  my_todo = Todo.new("Wash up")
  my_list.add(my_todo)
  my_todo.done? #=> false

it returns



