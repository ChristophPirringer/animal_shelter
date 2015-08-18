require('spec_helper')

describe(Customer) do

  describe('.all') do
    it('returns an empty array at first') do
      expect(Customer.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("lets you save customers to the database") do
      test_customer = Customer.new({:name => "Bob", :phone => "555555555", :breed_pref=> "Beagle", :type_pref  => "dog", :caretaker => "f", :id => nil})
      test_customer.save()
      expect(Customer.all()).to(eq([test_customer]))
    end
  end

  describe('#==') do
    it('is the same customer if it has the same attributes') do
      customer1 = Customer.new({:name => "Bob", :phone => "555555555", :breed_pref=> "Beagle", :type_pref  => "dog", :caretaker => "f", :id => nil})
      customer1.save()
      customer2 = Customer.new({:name => "Bob", :phone => "555555555", :breed_pref=> "Beagle", :type_pref  => "dog", :caretaker => "f", :id => nil})
      customer2.save()
      expect(customer1).to(eq(customer2))
    end
  end

  describe(".find") do
    it("returns a customer by its ID") do
      customer1 = Customer.new({:name => "Bob", :phone => "555555555", :breed_pref=> "Beagle", :type_pref  => "dog", :caretaker => "f", :id => nil})
      customer1.save()
      customer2 = Customer.new({:name => "Bob", :phone => "555555555", :breed_pref=> "Beagle", :type_pref  => "dog", :caretaker => "f", :id => nil})
      customer2.save()
      # binding.pry
      expect(Customer.find(customer1.id())).to(eq(customer1))
    end
  end

end
