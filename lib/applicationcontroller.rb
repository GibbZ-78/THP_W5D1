# applicationcontroller.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
# W5D1 - Gossip app upgraded with Sinatra + Rackup + Shotgun

# Useful includes and bundles
require 'bundler'
Bundler.require
require 'gossip.rb'

# ApplicationController - Class managing all the program logic and mechanics, derived from Sinatra::Base
class ApplicationController < Sinatra::Base

  @@csv_file = "db/gossip.csv"

  # get_csv_name - Return the relative path of the CSV file name to be used as a Gossip backup file
  #                Useful to have this CSV file name to be used within the Gossip class 
  #                or <possible improvement here> as a parameter / option when launching the Rackup or Shotgun command
  def self.get_csv_name
    return @@csv_file
  end

  # GET route for Gossip web site root
  get '/' do
    erb :index, locals: {gossips:Gossip.read_all(@@csv_file,true)}
  end

  # GET route for the Gossip 'new' sub-directory displaying the Gossip creation form
  get '/gossips/new' do
    erb :create_new_gossip
  end

  # POST route for the Gossip 'new' sub-directory collecting the Gossip creation form infos based on which a new Gossip is created and saved   
  post '/gossips/new' do
    Gossip.new(params['gossip_author'],params['gossip_content'],0,true).save_to_csv(@@csv_file,true)
    erb :confirm_new_gossip
  end

  # GET route to display one given Gossip with the 'id' passed through the URI as a sub-directory (is this what is called a REST API style approach?)
  get '/gossips/:id' do
    erb :show_gossip_by_id, locals: {gossip:Gossip.get_gossip_by_id(@@csv_file,params['id'].to_i,true)}
  end

  # GET route to the edit page of the Gossip with id = ':id'
  # WARNING - Doesn't seem to work when the ':variable' is not located at the end of the URI... If so, totally dumb!
  #           Hence '/gossips/:id/edit/' return a 404 error when '/gossips/edit/:id' works perfectly fine... Suxxx
  # UPDATE - Le problème provenait tout simplement de mon routage qui stipulait un "/" final que Sinatra de savait router...
  get '/gossips/:id/edit' do
    erb :update_gossip_by_id, locals: {gossip:Gossip.get_gossip_by_id(@@csv_file,params['id'].to_i,true)}
  end

  # POST route collecting the updated info from the form so as to udpate the related Gossip record in the CSV file
  # WARNING - Doesn't seem to work when the ':variable' is not located at the end of the URI... If so, totally dumb!
  #           Hence '/gossips/:id/edit/' return a 404 error when '/gossips/edit/:id' works perfectly fine... Suxxx
  # UPDATE - Le problème provenait tout simplement de mon routage qui stipulait un "/" final que Sinatra de savait router...
  post '/gossips/:id/edit' do
    Gossip.new(params['gossip_author'],params['gossip_content'],params['gossip_id'].to_i,false).update_in_csv_file(@@csv_file,true)
    redirect '/'
  end

  # GET route to deleting a given Gossip
  # UPDATE - Le problème provenait tout simplement de mon routage qui stipulait un "/" final que Sinatra de savait router...
  get '/gossips/:id/delete' do
    erb :delete_gossip_by_id, locals: {gossip:Gossip.suppr_gossip_from_CSV(@@csv_file,params['id'].to_i,true)}
  end

  # OLD S**T - Temporarily used when browsing THP learning material
  # Shows how to collect and use variables sent together with the POST method
  # WARNING - Kept here for pedagogical reasons only. In a production environment, would be deleted
  # post '/gossips/new/' do
  #   puts "Salut, je suis dans le serveur"
  #   puts "Ceci est le contenu du hash params : #{params}"
  #   puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params['gossip_author']}"
  #   puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params['gossip_content']}"
  #   puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
  # end

end

# applicationcontroller.rb - Coded with love & sweat by Jean-Baptiste VIDAL for THP Developer curriculum (Winter 2022)
