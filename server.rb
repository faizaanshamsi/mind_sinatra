require 'sinatra'
require 'socket'
require 'chartkick'

get '/' do
  socket = TCPSocket.new('127.0.0.1', 20000)
  @data = socket.recv( 100 )
  socket.close

  erb :index
end

# These lines can be removed since they are using the default values. They've
# been included to explicitly show the configuration options.
set :views, File.dirname(__FILE__) + '/views'
set :public_folder, File.dirname(__FILE__) + '/public'

# @data = { :delta=>7023617, :theta=>15294464, :lo_alpha=>15209472, :hi_alpha=>13321984,
#           :lo_beta=>4527616, :hi_beta=>12073472, :lo_gamma=>862464, :mid_gamma=>13637632 }
