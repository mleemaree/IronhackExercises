require "sinatra"
require "sinatra/reloader" if development?
require "pry"
require "guard"
require "themoviedb"

enable :sessions


get "/" do
	if session[:true] != true
	session[:movie_list] = []	
	key = Tmdb::Api.key("c7d5e0590d3c7d030a066809d9f9652c")
	configuration = Tmdb::Configuration.new
	session[:base] = configuration.base_url
	session[:size] = configuration.poster_sizes
	session[:link] = session[:base] + session[:size][2]
	else
		session[:movie_list]
		session[:hello]
	end
	erb :movie_search
end

post "/search" do
	session.delete(:movie_list)
	session[:movie_list] = []
	session[:true] = true
	search = Tmdb::Search.new.resource('movie').query(params[:si])
	searched = search.fetch.to_enum
	while session[:movie_list].length < 9
		searched.each{|m| session[:movie_list] << [m["title"], m["poster_path"]]}
		#session[:movie_list] << searched
		#session[:movie_list].delete_if{|v| v["poster_path"] == ""}
	end
	# session[:movie_list]
	session[:hello] = "hello"
	redirect "/"
end

