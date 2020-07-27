require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end
#w/ak
get '/gossips/:id/' do
  erb :show, locals: {gossips: Gossip.find(params['id']), id: params['id']}
end


get '/gossips/:id/edit/' do 
id = (params["id"])
erb :edit, locals: {gossip: Gossip.find(params['id']), id: params['id']}
end

post '/gossips/:id/edit/' do

Gossip.update(params["gossip_new_author"], params["gossip_new_content"],params['id'].to_i)
redirect '/'
end

end

  