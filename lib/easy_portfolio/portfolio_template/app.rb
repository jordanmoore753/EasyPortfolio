require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/content_for"
require "tilt/erubis"
require "rack"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do 

end

helpers do 

end

get "/" do 
  # You can include your Ruby code in here.
  # As of this point, there is no Ruby code in this application.
  # Wherever you want the code to appear, be sure to use <%= yield %> on that line.
  erb :layout
end