require('date')
require("pry")

class Animal
  attr_reader(:name, :sex, :date, :type, :breed, :customer_id, :id)

  define_method (:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @sex = attributes.fetch(:sex)
    @date = attributes.fetch(:date)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @customer_id = attributes.fetch(:customer_id)
    @id = attributes[:id]
  end

  define_method(:==) do |another_animal|
    self.name().==(another_animal.name())
  end

  define_singleton_method(:all) do
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each() do |animal|
      name = animal.fetch('name')
      sex = animal.fetch('sex')
      date = animal.fetch('date')
      type = animal.fetch('type')
      breed = animal.fetch('breed')
      customer_id = animal.fetch('customer_id').to_i()
      animals.push(Animal.new({:name => name, :sex => sex, :date => date, :type => type, :breed => breed, :customer_id => customer_id}))
    end
    animals
  end

  define_method(:save) do
    DB.exec("INSERT INTO animals (name, sex, date, type, breed, customer_id) VALUES ('#{@name}', '#{@sex}', #{@date}, '#{@type}', '#{@breed}', #{@customer_id});")
  end

  define_singleton_method(:find) do |id|
    found_animals = nil
    Animal.all().each() do |animal|
      if animal.id().==(id)
        found_animals = animal
      end
    end
    found_animals
  end

end
