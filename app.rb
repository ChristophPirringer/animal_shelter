require('sinatra')
require('sinatra/reloader')
require('./lib/animal')
require('./lib/customer')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "animal_shelter_test"}) #for test
# DB = PG.connect({:dbname => "animal_shelter"}) #for use

get("/") do
  erb(:index)
end

get("/customers/new") do
  erb(:customer_form)
end

get("/animals/new") do
  erb(:animal_form)
end
