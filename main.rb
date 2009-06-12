require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

get '/about' do
  haml :about
end

get '/projects' do
  haml :projects
end

get '/contact' do
  haml :contact
end
