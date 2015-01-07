get '/' do
  erb :index
end

get '/art/:artist' do
  @artist = Art.find_by(name: params[:name])
erb :my_art
end

post '/art_lookup' do

redirect '/art/:artist'
end

