require "sinatra"
require "sinatra/reloader"
require "./models/task.rb"
require "./models/todolist.rb"

class Task
    attr_reader :content, :id
    @@current_id = 1
    def initialize(content)
        @content = content
        @id = @@current_id
        @@current_id += 1
        @complete = false
        @created_at = Time.now.asctime
    end

    def created_at
    	@created_at = Time.now.asctime
    end

    def complete?
    	@complete = false
    	@complete
    end

    def completed!
    	@complete = true
    	@complete
    end

    def make_incomplete!
    	@complete = false
    	@complete
    end

    def update_content!(update)
    	@content = update
    	@content
    end
end

class TodoList
    attr_reader :tasks, :user
    def initialize(user)
        @tasks = []
        @user = user
    end

    def add_task(task)
    	@tasks << task
    	@tasks
    end

    def delete_task(id_num)
    	@tasks.delete_if {|n| n.id == id_num}
    end

    def find_task_by_id(id_num)
    	@tasks.each{|t| id_num == t.id ? id : nil}
    	return nil
    end

    def sort
    	@tasks.sort { | t1, t2 | t1.created_at <=> t2.created_at }
    end

    def create_user
    	@user = @user
    end

end