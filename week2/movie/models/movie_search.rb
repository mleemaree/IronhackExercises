require "sinatra"
require "sinatra/reloader" if development?
require "./models/movie_search.rb"
require "pry"
require "guard"
require "imdb"


  class MovieSearch
  	attr_reader :movie_list

  	def initialize
  		@movie_list = []
  	end

  	def query(schwing)
		Imdb::Search.new(schwing)
  	end

  	def seyarch
  		@movies_search.movies[0..8].each{ |m| @movie_list.push([m.rating, m.title])}
  	end

  end