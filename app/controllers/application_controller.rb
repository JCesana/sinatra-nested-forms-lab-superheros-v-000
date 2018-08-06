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
      binding.pry 
      @team = Team.new(params[:team][:name], params[:team][:motto])
      binding.pry 
      params[:team][:members].each do |details|
        binding.pry 
        Superhero.new(details)
        binding.pry 
      end 
      binding.pry 
      @heros = Superhero.all 
      binding.pry 
      erb :show
    end 
    
end
