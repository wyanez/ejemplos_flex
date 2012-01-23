require 'sinatra'
require 'json'

get '/hola/:nombre' do
    #data=["Hola #{params[:nombre]}!","Hi #{params[:nombre]}!" ]
    data={:spanish => "Hola #{params[:nombre]}!",
          :english => "Hi #{params[:nombre]}!" }
    
    JSON.dump(data)    
end
