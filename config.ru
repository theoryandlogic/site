require 'rubygems'
require 'sinatra'

set :env,  :production
disable :run

require 'main.rb'
run Sinatra::Application

