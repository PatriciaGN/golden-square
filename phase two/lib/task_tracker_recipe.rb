1. Describe the Problem

Put or write the user story here. Add any clarifying notes you might have.

1

As a user So that I can keep track of my tasks I want a program that I can add todo tasks to and see a list of them.
2

As a user So that I can focus on tasks to complete I want to mark tasks as complete and have them disappear from the list.
2. Design the Class Interface

Include the initializer and public methods with all parameters and return values.

class ToDo
  def initialize 
    # list as empty array
  end

  def add_to_list(task) # task as a string
    # no return value
  end

  def show_list
    # returns a list of tasks as strings 
  end

  def complete_task(task) # task as a string
    #no return value
  end
end
3. Create Examples as Tests

Make a list of examples of how the class will behave in different situations.

# 1
todo = ToDo.new
todo.add_to_list("") # fails with "Please enter your task."

# 2
todo = ToDo.new
todo.add_to_list("Task one")
todo.show_list # => "Task one"

# 3
todo = ToDo.new
todo.add_to_list("Task one")
todo.add_to_list("Task two")
todo.show_list # => "Task one; Task two"

# 4
todo = ToDo.new
todo.complete_task("Task one") # => fails "This task is not found!"

# 5
todo = ToDo.new
todo.add_to_list("Task one")
todo.add_to_list("Task two")
todo.complete_task("Task one")
todo.show_list # => "Task two"
Encode each example as a test. You can add to the above list as you go.

4. Implement the Behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.