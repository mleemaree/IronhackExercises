require "sinatra"
require "sinatra/reloader"
require 'pry'

@fnum = 0
@snum = 0
@sum = 0
@string = ""

get "/" do
	erb :calc
end

get "/add" do
	erb :add
end

post "/adding" do

redirect "/add/#{params[:fnum]}/#{params[:snum]}"

end

get "/add/:fnum/:snum" do
	@fnum = params[:fnum]
	@snum = params[:snum]
	first = @fnum.to_i
	sec = @snum.to_i
	@sum = first+sec
	@string = @sum.to_s
	erb :add
end