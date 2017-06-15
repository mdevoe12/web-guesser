require 'sinatra'
require 'sinatra/reloader'

get '/' do
  random_num = rand(100)
  "The secret number is #{random_num}"
end
