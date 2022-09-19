1. Describe the Problem
As a user
I want to be able to add my tasks and mark when they are done. 
I want to be able to know if a task is completed.


2. Design the Class Interface
Name: TodoList


* Initialize
  Constructs the variable @tasks which equals an empty array.

* task
 Returns the task as a string. No side effects.

* mark_done!
 Marks the todo as done. Doesn't return anything

* done?
Returns true if the task is done and false if not.

3. Create Examples as Tests

* Initialize
it "constructs an empty array and stores it in the variable @tasks"
 my_todo = Todo.new("Wash up")

* task
it returns an empty string if todo empty
 my_todo = Todo.new("")
 my_todo.task #=> ""

it returns the task
 my_todo = Todo.new("Wash up")
 my_todo.task #=> "Wash up"

* mark_done! 
returns an error if a todo was already done
 my_todo = Todo.new("Wash up")
 my_todo.mark_done!
 my_todo.mark_done! #=> "That todo was already marked as done"

it marks a todo as done
 my_todo = Todo.new("Wash up")
 my_todo.mark_done!
   #=> @done_tasks = ["Wash up"]

 * done?
 returns true if task has been done
  my_todo = Todo.new("Wash up")
  my_todo.mark_done!
  my_todo.done? #=> true

 returns false if task hasn't been done
  my_todo = Todo.new("Wash up")
  my_todo.done? #=> true









4. Implement the Behaviour