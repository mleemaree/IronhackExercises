require "sinatra"
require "sinatra/reloader" if development?
require "./lib/task"
require "./lib/todolist"
require "pry"
require "guard"


enable :sessions


get "/" do
	if session[:user] != nil 
	 redirect "/tasks"
	else
	end
	erb :index
end

post "/create_user" do
	session[:user] = params[:user].capitalize!
	redirect "/tasks"
end

# get "/session-data" do
# 	@text = session[:data]
# 	erb :index
# end

# get "/:text" do
# 	session[:anything] = params[:text]
# 	redirect "/"
# end

get "/tasks" do
	if session[:user] == nil
		redirect "/"
	end
	
	if session[:true] != true 
		session[:list] = TodoList.new(session[:user])
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
	session[:list].find_task_by(params[:sid].to_i).completed!
	redirect "/tasks"
end

post "/delete" do
	session[:list].delete_task(params[:sid].to_i)
	redirect "/tasks"
end

