require 'rubygems'
require 'sinatra'
require 'sinatra/json'
require 'active_record'
require 'yaml'

$: << File.expand_path('../../app', __FILE__)

ENV['RACK_ENV'] = 'development' unless ENV['RACK_ENV'].present?

require 'bundler'
Bundler.setup(:default, ENV['RACK_ENV'])

# setting up our environment
env_index = ARGV.index("-e")
env_arg = ARGV[env_index + 1] if env_index
env = env_arg || ENV['RACK_ENV']

use ActiveRecord::ConnectionAdapters::ConnectionManagement

if ENV['RACK_ENV'] == 'staging'
  ActiveRecord::Base.establish_connection(
    'postgresql://notes_master:password@notes-db-instance-1.cwarswmeoza2.us-east-1.rds.amazonaws.com:5432/notes_db'
  )
else
  databases = YAML.load_file("config/database.yml")
  ActiveRecord::Base.establish_connection(databases[env])
end

