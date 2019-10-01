require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Start our app console"
#This allows us to create our own console, so we can test stuff
task :c do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end