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

end