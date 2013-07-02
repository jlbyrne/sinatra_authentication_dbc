enable :sessions
require 'bcrypt'

get '/' do
  @id = session[:id]
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  new_user = User.authenticate(params[:email], params[:password])
  redirect '/' if new_user == nil
  session[:id] = new_user.id
  redirect '/'
end

delete '/sessions/:id' do
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  # created_user = User.create(name: user_info[:name], email: user_info[:email], password_hash: user_info[:password_hash])
  created_user = User.create(params[:user])
  session[:id] = created_user.id
  redirect "/"
end
