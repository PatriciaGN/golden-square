require "todo_class.rb"

class TodoList
  attr_accessor :tasks #_done, :tasks_not_done

    def initialize
      @tasks = []
    end
  
    def add(todo) # todo is an instance of Todo
      # Returns nothing
      @tasks << todo
    end
  
    def incomplete
      # Returns all non-done todos
      @tasks.select { |task| task.completed == false }
    end
  
    def complete
      # Returns all complete todos
      # @tasks_done
      @tasks.select { |task| task.completed == true }
    end
  
    def give_up!
      # Marks all todos as complete
    end
  end