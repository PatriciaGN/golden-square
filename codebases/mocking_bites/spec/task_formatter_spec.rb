require_relative "../lib/task_formatter.rb"

RSpec.describe TaskFormatter do
    describe "#format" do
        it "formats a completed task" do
            task_1 = TaskFormatter.new(double :task, title: "Walk the dog", complete?: true)
            expect(task_1.format).to eq "- [x] Walk the dog"
        end

        it "formats an uncompleted task" do
            task_2 = TaskFormatter.new(double :task, title: "Walk the cat", complete?: false)
            expect(task_2.format).to eq "- [ ] Walk the cat"
        end
    end
end