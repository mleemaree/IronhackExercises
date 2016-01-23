require "sinatra"
require "sinatra/reloader" if development?
# require "./models/movie_search.rb"
require "pry"
require "guard"
require "imdb"


enable :sessions

get "/" do
	erb :movie_search
end

post "/search" do
	session[:true] = true
	session[:movie_list]=[]
	session[:search] = params[:si]
	session[:search_query] = Imdb::Search.new(session[:search]).movies.to_enum
	while session[:movie_list].length < 9
		session[:movie_list] << session[:search_query].next 
		session[:movie_list].delete_if{|m| m.poster == nil}
	end
	session[:movie_list]
	redirect "/game"
end

get "game" do
	erb :game
end

