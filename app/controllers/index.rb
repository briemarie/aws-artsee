#This is the homepage
get '/' do
  erb :index
end

#This is the post route for the pop-up box that occurs on the homepage
post '/art_lookup' do
  @artist = Art.find_by(name: params[:name])

  redirect '/art/#{@artist.name}'
end

#This is the route for displaying the art from the API
get '/art/:artist' do
  redirect "http://www.brooklynmuseum.org/opencollection/api/
                ?method=collection.search&version=1&format=json&api_key=[#{API_KEY}]&keyword=#{params[:artist]}"
end


