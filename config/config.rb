class EvilLeague
  # We need to enable sessions to work with Rack::Flash
  enable :sessions

  # Let's use rack-flash to notify the user
  use Rack::Flash

  configure :production do
    DataMapper::setup(:default, ENV['DATABASE_URL'])

    get '/migratedb' do
      puts ENV['DATABASE_URL']
      DataMapper.auto_migrate!
    end
  end
end
