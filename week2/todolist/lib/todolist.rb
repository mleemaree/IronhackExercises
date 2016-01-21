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

    def find_task_by(id_num)
       @tasks.map{|t| id_num == t.id ? t : nil}
    end

    def sort
    	@tasks.sort { | t1, t2 | t1.created_at <=> t2.created_at }
    end

    def create_user
    	@user = @user
    end

end

