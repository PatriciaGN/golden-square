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
In integration spec

 * done?
In integration spec


4. Implement the Behaviour