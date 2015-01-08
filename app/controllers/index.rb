#This is the homepage
get '/' do

  erb :index
end

#This is the post route for the pop-up box that occurs on the homepage
post '/' do

  redirect "/#{params[:artist]}"
end

#This is the route for displaying the art from the API
#Waiting to hear back from Museum about why string interpolation is not allowed in their API URI's, hard coded for now
get '/:artist' do

  if params[:artist] == "Picasso"
    redirect "https://www.brooklynmuseum.org/opencollection/api/?method=collection.search&version=1&format=html&api_key=API_KEY&keyword=Picasso"

  elsif params[:artist] == "Monet"
    redirect "https://www.brooklynmuseum.org/opencollection/api/?method=collection.search&version=1&format=html&api_key=API_KEY&keyword=Monet"
  else
      erb :art
  end
end




