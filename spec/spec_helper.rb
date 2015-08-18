require('rspec')
require('animal')
require('customer')
require('pry')
require('pg')
require('launchy')
require('date')

DB = PG.connect({:dbname => 'animal_shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM customers *;")
  end
end
