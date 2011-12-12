class EvilLeague
  # We need to enable sessions to work with Rack::Flash
  enable :sessions

  # Let's use rack-flash to notify the user
  use Rack::Flash

  DataMapper::setup(:default, ENV['DATABASE_URL'])
end
