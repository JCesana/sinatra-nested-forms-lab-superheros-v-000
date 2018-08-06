require 'sinatra/base'
require 'pry'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
      erb :index 
    end 
    
    get '/team/new' do 
      erb :new 
    end 
    
    post '/teams' do 
      @team = params
      
      erb :show
    end 
    
end
