require 'sinatra'
require 'sinatra/activerecord'

@environment = ENV['RACK_ENV'] || 'development'
@dbconfig = YAML.load(File.read('db/config.yml'))
ActiveRecord::Base.establish_connection @dbconfig[@environment]

current_dir = Dir.pwd
Dir["#{current_dir}/plugins/models/*.rb"].each { |file| require file }

current_dir = Dir.pwd
Dir["#{current_dir}/plugins/services/*.rb"].each { |file| require file }
