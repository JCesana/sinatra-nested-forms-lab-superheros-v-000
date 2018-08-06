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
      @team = Team.new(params[:team][:name], params[:team][:motto])
      
      params[:team][:members].each do |details|
        Superhero.new(details)
      end 
      
      @heros = Superhero.all 
      
      erb :show
    end 
end
