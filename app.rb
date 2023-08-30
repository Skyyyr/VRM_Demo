require 'sinatra'

get '/' do
  'Hello, world!'
end
require 'sinatra'
require 'mongo'
require 'json'

set :bind, '0.0.0.0'

client = Mongo::Client.new(['127.0.0.1:27017'], database: 'mydb')
db = client.database
collection = client[:counters]

get '/counter' do
  counter = collection.find(name: 'clicks').first
  counter ? counter['value'].to_s : '0'
end

post '/counter' do
  new_value = params['value'].to_i
  counter = { name: 'clicks', value: new_value }
  collection.find(name: 'clicks').find_one_and_replace(counter, upsert: true)
  'OK'
end
