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
	end
	erb :movie_search
end

post "/search" do
	session.delete(:movie_list)
	session[:movie_list] = []
	session[:true] = true
	search = Tmdb::Search.new.resource('movie').query(params[:si])
	searched = search.fetch.to_enum
	searched.each do |m|
		if session[:movie_list].length < 9 && m["poster_path"] != nil
			session[:movie_list] << [m["title"], m["poster_path"], m["popularity"]]
		end
	end
	redirect "/"
end

