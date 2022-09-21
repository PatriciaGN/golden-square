1. Describe the Problem
As a user
I want to be able which todos I have completed and which ones I haven't.
I want to be able to mark all todos as complete at the same time.


2. Design the Class Interface
Name: TodoList


* Initialize
  Constructs the variables @tasks_done and @task_not_done which equal an empty array.

* add(todo)
  Adds a todo to @task_not_done. Returns nothing.

* incomplete
  Returns @tasks_not_done

* complete
  Returns @tasks_done

* give up!
  Removes all contents of @tasks_not_done and adds them to @tasks_done

3. Create Examples as Tests

* initialize
It constructs the variables @tasks_done and @task_not_done which equal an empty array.

my_list = TodoList.new


Tests in integration recipe


4. Implement the Behaviour