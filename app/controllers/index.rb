#This is the profile/search page
get '/' do

  erb :profile
end

post '/' do

  redirect "/#{params[:artist]}"
end

#This is the route for displaying the art from the API
get '/:artist' do

  uri = "https://www.brooklynmuseum.org/opencollection/api/?method=collection.search&version=1&format=html&&sort_field=name&image_results_limit=20&api_key=" + "#{ENV['API_KEY']}" + "&keyword=" + "#{params[:artist]}"

  doc = Nokogiri::HTML(open(uri))
  @art = doc.xpath("//li")
  p uri

  if @art.empty?
    erb :happy
  else
     erb :art
  end
end



