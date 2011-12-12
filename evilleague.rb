require 'bundler'
Bundler.setup
Bundler.require(:default)

# In order not to pollute the global namespace with our methods
# and routes, let's subclass the Sinatra::Base classe.
class EvilLeague < Sinatra::Base

  # Let's define a route for the home screen here
  get '/' do
    erb :'default.html', :layout => false
  end

  post '/add' do
    evil_member = EvilUser.new(params)

    if evil_member.save
      flash[:notice] = "Welcome to the evil league, #{params[name]}!"
    else
      flash[:error] = "Sorry, try again."
    end

    redirect '/'
  end

end

# Let's describe a member of the evil league
class EvilUser
  include DataMapper::Resource

  property :id, Serial

  property :name, String,
  :required => true,
  :unique => true,
  :length => 3..50

end

require_relative 'config/config.rb'

DataMapper.finalize
