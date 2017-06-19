require 'sinatra'
require 'sinatra/reloader'

random = rand(100)

get '/' do
  "THE SECRET NUMBER IS #{random}"
  # "Hello World"
end
