# applicationcontroller.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W5D1 - Gossip app upgraded with Sinatra + Rackup + Shotgun

# Useful includes and bundles
require 'bundler'
Bundler.require
require 'gossip.rb'

# ApplicationController - Class managing all the program logic and mechanics, derived from Sinatra::Base
class ApplicationController < Sinatra::Base

  @@csv_file = "db/gossip.csv"

  def self.get_csv_name
    return @@csv_file
  end

  get '/' do
    erb :index, locals: {gossips:Gossip.read_all(@@csv_file,false)}
  end

  get '/gossips/new/' do
    erb :create_new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params['gossip_author'],params['gossip_content'],0,true).save_to_csv(@@csv_file,false)
    erb :confirm_new_gossip
  end

  get '/gossips/:id' do
    erb :show_gossip_by_id, locals: {gossip:Gossip.get_gossip_by_id(@@csv_file,params['id'].to_i,false)}
  end

  get '/gossips/:id/edit/' do
    # erb :update_gossip_by_id, locals: {gossip:Gossip.get_gossip_by_id(@@csv_file,params['id'].to_i,false)}
    "<html><body><h1>Hello !</h1></body></html>"
  end

  post '/gossips/:id/edit/' do
    Gossip.new(params['gossip_author'],params['gossip_content'],params['gossip_id'],false).update_in_csv_file(@@csv_file,false)
  end

  # OLD S**T - Temporarily used when browsing THP learning material
  # Shows how to collect and use variables sent together with the POST method
  # post '/gossips/new/' do
  #   puts "Salut, je suis dans le serveur"
  #   puts "Ceci est le contenu du hash params : #{params}"
  #   puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params['gossip_author']}"
  #   puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params['gossip_content']}"
  #   puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  # end

end

# applicationcontroller.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
