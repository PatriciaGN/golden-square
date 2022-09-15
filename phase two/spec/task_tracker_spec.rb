require_relative "../lib/task_tracker.rb"

RSpec.describe ToDo do
  describe '#add_to_list' do
    it 'fails when empty string is passed' do
      todo = ToDo.new
      expect{ todo.add_to_list("") }.to raise_error "Please enter your task."
    end
  end

  describe '#show_list' do
    it 'shows the tasks in a list' do
      todo = ToDo.new
      todo.add_to_list("Task one")
      expect(todo.show_list).to eq "Task one"
    end

    it 'shows the tasks in a list' do
      todo = ToDo.new
      todo.add_to_list("Task one")
      todo.add_to_list("Task two")
      expect(todo.show_list).to eq "Task one\nTask two"
    end
  end

  describe '#complete_task' do
    it "fails when task doesn't exist" do
      todo = ToDo.new
      expect{ todo.complete_task("Task one") }.to raise_error "This task is not found!"
    end

    it "removes task from the list" do
      todo = ToDo.new
      todo.add_to_list("Task one")
      todo.add_to_list("Task two")
      todo.complete_task("Task one")
      expect(todo.show_list).to eq "Task two"
    end

    it "removes task from the list" do
      todo = ToDo.new
      todo.add_to_list("Task one")
      todo.add_to_list("Task two")
      todo.complete_task("Task one")
      todo.complete_task("Task two")
      expect{ todo.show_list }.to raise_error "No tasks exist!"
    end
  end

end