require 'rubygems'
require 'sinatra'

set :environment,  :production
disable :run

require 'main.rb'
run Sinatra::Application

