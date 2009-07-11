require 'rubygems'
require 'sinatra'
require 'main'

root_dir = File.dirname(__FILE__)

set :environment, :development
set :root, root_dir
set :app_file, File.join(root_dir, 'main.rb')
disable :run

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new('log/app.log', 'a')
$stdout.reopen(log)
$stderr.reopen(log)


map '/' do 
  run Theory::Site
end

map '/blog' do
  run Theory::Blog
end

