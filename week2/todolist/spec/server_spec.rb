require "rspec"
require "./server"
require "rack/test"

RSpec.describe Task do

describe "Server Service" do
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

describe "#home" do
	it "should load #home" do
		get "/tasks"
		expect(last_response.to be_ok)
	end
end










end #desc server service



end #rspec