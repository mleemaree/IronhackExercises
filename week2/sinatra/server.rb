require "sinatra"
require "sinatra/reloader"

shopping_list = []

get "/" do
  @ingredients = ["do...", "you....", "quack??"]
  erb :author
end

get "/users/:username" do
  @username = params[:username]
  erb :user_profile
end

get "/hours/ago/:hours" do
 minus = params[:hours].to_i
 hour = Time.now - (minus*3600)
 @date = hour.asctime
  erb :time
end

get "/username" do
	erb :username
end

get "/form" do
	@shopping_list = shopping_list
	erb :form
end

post "/item" do
	shopping_list << params[:item]
	redirect "/form"
end

get "/users/:username" do
	@username = params[:item]
	erb :username
end