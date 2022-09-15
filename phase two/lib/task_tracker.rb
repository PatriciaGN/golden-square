# Paired with Kate for this exercise

class ToDo
    def initialize 
      @list = []
    end
  
    def add_to_list(task) 
      fail "Please enter your task." if task.empty?
      @list << task
    end
  
    def show_list
      fail "No tasks exist!" if @list.empty?
      @list.join("\n")
    end
  
    def complete_task(task) # task as a string
      task_included = @list.include?(task)
      fail "This task is not found!" if task_included  == false
  
      @list.delete(task) if task_included 
    end
  end