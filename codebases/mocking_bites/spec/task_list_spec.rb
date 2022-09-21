require "task_list"

RSpec.describe TaskList do
  describe "#initialize" do
    it "initially has an empty list" do
      task_list = TaskList.new
      expect(task_list.all).to eq []
    end

    it "is initially not all complete" do
      task_list = TaskList.new
      expect(task_list.all_complete?).to eq false
    end
  end
  
  describe "#add" do
    it "returns one task when only one added" do
      task_list = TaskList.new
      task1 = double :task
      task_list.add(task1)
      expect(task_list.all).to eq [task1]
    end

    it "returns all tasks added" do
      task_list = TaskList.new
      task1 = double :task
      task2 = double :task
      task_list.add(task1)
      task_list.add(task2)
      expect(task_list.all).to eq [task1, task2]
    end
  end

  describe "#all_complete?" do
    it "returns false if no tasks have been added" do
      list = TaskList.new
      expect(list.all_complete?).to eq false
    end

    it "returns false if only one uncompleted task" do
      list = TaskList.new
      task = double :task, complete?: false
      list.add(task)
      expect(list.all_complete?).to eq false
    end
    
    it "returns false if there are several uncompleted tasks" do
      list = TaskList.new
      task = double :task, complete?: false
      task2 = double :task, complete?: true
      list.add(task)
      expect(list.all_complete?).to eq false
    end

    it "returns true if all tasks have been completed" do
      list = TaskList.new
      task = double :task, complete?: true
      task2 = double :task, complete?: true
      list.add(task)
      expect(list.all_complete?).to eq true
    end
    # Unit test `#all` and `#all_complete?` behaviour
  end
end
