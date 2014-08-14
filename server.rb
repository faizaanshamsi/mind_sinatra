require 'sinatra'
require 'socket'
require 'chartkick'

get '/mind' do
  socket = TCPSocket.new('127.0.0.1', 20000)
  @data = eval(socket.recv( 200 ))
  socket.close
  erb :index
end

# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'
