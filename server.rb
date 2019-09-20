require 'sinatra'
require 'sinatra/json'
require 'json'

set :public_folder, proc { File.join(root) }
enable :sessions

session[:temp] =

get '/thermostat' do
  headers 'Access-Control-Allow-Origin' => '*'
  json({temp: 26,
    maxTemp: 25,
    powerSaving: 'red'})
end

post '/thermostat/save' do
  session[:temp] = params[:temp]
  session[:maxTemp] = params[:maxTemp]
  session[:powerSaving] = params[:powerSaving]
end
