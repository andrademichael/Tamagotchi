require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end
