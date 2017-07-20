require 'sinatra'
require 'sinatra/activerecord'

@environment = ENV['RACK_ENV'] || 'development'
@dbconfig = YAML.load(File.read('db/config.yml'))
ActiveRecord::Base.establish_connection @dbconfig[@environment]

current_dir = Dir.pwd
Dir["#{current_dir}/models/*.rb"].each { |file| require file }

get '/conferences' do
  Conference.all.to_json
end
