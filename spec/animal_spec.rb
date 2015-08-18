require('spec_helper')

describe(Animal) do

  describe('.all') do
    it('returns an empty array at first') do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("lets you save animals to the database") do
      test_animal = Animal.new({:name => "Fido", :sex => "male", :date => "20150101", :type => "dog", :breed => "Beagle", :customer_id => 1})
      test_animal.save()
      expect(Animal.all()).to(eq([test_animal]))
    end
  end

  describe('.find') do
    it("lets you find animals by ID") do
      test_animal = Animal.new({:name => "Fido", :sex => "male", :date => "20150101", :type => "dog", :breed => "Beagle", :customer_id => 1})
      test_animal.save()
      test_animal1 = Animal.new({:name => "Fido", :sex => "male", :date => "20150101", :type => "dog", :breed => "Beagle", :customer_id => 1})
      test_animal1.save()
      expect(Animal.find(test_animal.id())).to(eq(test_animal))
    end
  end

end
