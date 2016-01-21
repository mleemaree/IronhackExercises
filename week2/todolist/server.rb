require "sinatra"
require "sinatra/reloader" if development?
require "./lib/task"
require "./lib/todolist"
require "pry"

enable :sessions


get "/" do
	erb :index
end

get "/session-data" do
	@text = session[:data]
	erb :index
end

# get "/:text" do
# 	session[:anything] = params[:text]
# 	redirect "/"
# end

get "/tasks" do
	if session[:true] != true 
		session[:list] = TodoList.new("Antti")
	else
		session[:list] 
	end
	erb :task_index
end

get "/new_task" do
	erb :new_task
end

post "/create_task" do
	session[:true] = true
	session[:task] = Task.new(params[:new_task])
	session[:list].add_task(session[:task])
	session[:list]
	redirect "/tasks"
end

post "/complete" do
	session[:task].completed!
	redirect "/tasks"
end

post "/delete" do
	session[:list].delete_task(params[:sid].to_i)
	redirect "/tasks"
end

