require "todo_class.rb"

class Todo
  attr_accessor :task, :completed

    def initialize(task) # task is a string
      @task = task
      @completed = false
    end
  
    def task
      @task
    end
  
    def mark_done!
      fail "That todo was already marked as done" if self.completed == true
      self.completed = true
    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
      self.completed
    end
  end