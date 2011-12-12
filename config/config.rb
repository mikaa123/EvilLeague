class EvilLeague
  # Let's use rack-flash to notify the user
  use Rack::Flash

  DataMapper::setup(:default, ENV['DATABASE_URL'])
end
