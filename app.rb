require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'resque'
require 'json'

Dir["models/*"].each {|file| require_relative file }

configure do

end

helpers do
	def link_to(url,text=url,opts={})
	  attributes = ""
	  opts.each { |key,value| attributes << key.to_s << "=\"" << value << "\" "}
	  "<a href=\"#{url}\" #{attributes}>#{text}</a>"
	end
end

get '/' do
	haml :main
end

get '/:param' do
	query_param = params[:param]

	# do something with that param

	content_type :json
	{ :status => 'success', :message => "query was #{query_param}"}.to_json
end

not_found do
  content_type :json
  { :status => 'failure', :message => 'not found'}.to_json
  # haml :not_found_oops, :layout => false
end
