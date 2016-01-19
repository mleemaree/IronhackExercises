require 'rspec'
require "./server"

RSpec.describe Task do

	before :each do
		@task = Task.new("hi")
		@list = TodoList.new("josh")
	end

	describe "tasks" do
		# it "initial completed?" do
		# 	expect(@task.complete?).to eq(false)
		# end

		it "should mark a task complete" do
			expect(@task.completed!).to eq(true)
		end

		it "should mark a task as incomplete?" do
			expect(@task.make_incomplete!).to eq(false)
		end

		it "should change the content" do
			expect(@task.update_content!("HERRO")).to eq("HERRO")
		end

	end



	describe "TodoList" do

		it "should add tasks to tasks" do
			expect(@list.add_task(@task)).to eq([@task])
		end

		it "deletes a task by id #" do
			remove = @list
			remove.add_task(@task)
			expect(remove.delete_task(5)).to eq([])
		end

		#fix me
		it "should find task by id #" do
			find = @list
			brush = @task
			find.add_task(brush)
			find.find_task_by_id(1)
			expect(find.tasks[0].id).to eq(6)
		end

		# it "sorts list by created date" do
		# 	sort = @list
		# 	sort.add_task("Brush")
		# 	sort.add_task("Walk")

		# end

		it "should initialize a user in new list" do
			expect(@list.create_user).to eq("josh" )
		end


	end
end
