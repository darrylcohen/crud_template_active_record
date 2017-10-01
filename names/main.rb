
require 'sinatra'
require 'sinatra/reloader'
require_relative 'db_config'
require_relative 'models/name'
require_relative 'models/user'
require 'pry'

enable :sessions # sinatra provide this feature

helpers do

  def current_user
    User.find_by(id: session[:user_id]) # find only finds by id
  end

  def logged_in?
    !!current_user #will return true or false
    if current_user
      return true
    else
      return false
    end
  end
end

get '/' do
  erb :index
end

get '/names' do
  @names = Name.all
  erb :names
end

#CREATE / NEW
get '/names/new' do
  erb :new
end

post '/names' do
  aName = Name.new
  aName.name = params[:name]
  aName.save
  redirect '/names'
end

#READ
get '/names/:id' do
  @name = Name.find(params[:id])
  erb :show
end

#DELETE
delete '/names/:id' do

  redirect 'login' unless logged_in?

  name = Name.find(params[:id])
  name.destroy()
  redirect '/names'
end

#EDIT / UPDATE
get '/names/:id/edit' do
  @name = Name.find(params[:id])
  erb :edit
end

put '/names/:id' do
  aName = Name.find(params[:id])
  aName.name = params[:name]
  aName.save
  redirect '/names'
end

get '/login' do
  erb :login
end

# creating a session when loggin in
post '/session' do
  # find user
  user = User.find_by(email: params[:email])

  # succesful create session then redirect
  if user && user.authenticate(params[:password])
    #session = {}
    session[:user_id] = user.id
    redirect '/names'
  else
    @message = 'Incorrect email or password'
    erb :login #not redirect as want to keep variables
  end

end

delete '/session' do
  session[:user_id] = nil
  redirect '/names'
end
