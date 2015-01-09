#This is the sign-up page
get '/' do

  erb :sign_up
end

post '/' do
  new_user = User.new(params[:user])
  new_user.save

  redirect '/sessions/new'
end


#This is the sign-in page (sessions)
get '/sessions/new' do

  erb :sign_in
end

post '/sessions' do
  @user = User.find_by(email: params[:email])

  if @user.authenticate?(params[:password])
    session[:user_id] = @user.id
    redirect '/search'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  session[:user_id] = nil
  redirect '/'
end


#This is the profile/search page
get '/search' do

  erb :profile
end

post '/search' do

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


