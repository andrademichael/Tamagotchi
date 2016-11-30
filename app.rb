require('sinatra')
require('sinatra/reloader')
require('./lib/tamagotchi')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:homepage_create)
end

post('/pets_list') do
  @@all_pets = Tamagotchi.all
  name = params.fetch("form_name")
  new_pet = Tamagotchi.new(name)
  new_pet.save()
  erb(:pets_list)
end

get('/pets_list') do
  @@all_pets = Tamagotchi.all
  erb(:pets_list)
end

get('/pet_view/:id') do
  @this_pet = @@all_pets.find(params.fetch("id"))
  erb(:pet_view)
end

get('/clear') do
  @@all_pets.clear()
  erb(:pets_list)
end

post('/feed') do
#methods
  erb(:pet_view)
end
