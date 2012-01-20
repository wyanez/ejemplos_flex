require 'sinatra'
require 'json'

get '/hola/:nombre' do
    data=["Hola #{params[:nombre]}!",
          "Hi #{params[:nombre]}!" ]
    JSON.dump(data)    
end
