#This is the signup page
get '/' do

  erb :sign_up
end

post '/' do
  new_user = User.new(params[:user])
  new_user.save

  redirect '/users'
end

get '/users' do

  erb :sign_in
end

post '/users' do
  user = User.find(email: params[:email])

  redirect '/users/#{user.id}'
end


#This is the profile/search page
get 'users/:id' do

  erb :profile
end

post 'users/:id' do

  redirect "/#{params[:artist]}"
end

#This is the route for displaying the art from the API
get '/:artist' do

  uri = "https://www.brooklynmuseum.org/opencollection/api/?method=collection.search&version=1&format=html&&sort_field=name&image_results_limit=20&api_key=" + "#{ENV['API_KEY']}" + "&keyword=" + "#{params[:artist]}"

  doc = Nokogiri::HTML(open(uri))
  @art = doc.xpath("//li")

  if @art.empty?
    erb :happy
  else
     erb :art
  end
end


