require 'rubygems'
require 'sinatra'

layout 'site.erb'

get '/' do
  erb :index, :layout => 'site.erb'
end

get '/about' do
  erb :about
end

get '/projects' do
  erb :projects
end

get '/contact' do
  erb :contact
end
