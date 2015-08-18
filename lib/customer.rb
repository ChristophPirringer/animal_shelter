class Customer
  attr_reader(:name, :phone, :breed_pref, :type_pref, :caretaker, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @breed_pref = attributes.fetch(:breed_pref)
    @type_pref = attributes.fetch(:type_pref)
    @caretaker = attributes.fetch(:caretaker)
    @id = attributes.fetch(:id)
  end

  define_method(:==) do |another_customer|
    self.name().==(another_customer.name()) && (self.phone().==(another_customer.phone())) && (self.breed_pref().==(another_customer.breed_pref())) && (self.type_pref().==(another_customer.type_pref())) && (self.caretaker().==(another_customer.caretaker()))
  end

  define_singleton_method(:all) do
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each() do |customer|
      name = customer.fetch('name')
      phone = customer.fetch('phone')
      breed_pref = customer.fetch('breed_pref')
      type_pref = customer.fetch('type_pref')
      caretaker = customer.fetch('caretaker')
      id = customer.fetch('id').to_i()
      customers.push(Customer.new({:name => name, :phone => phone, :breed_pref => breed_pref, :type_pref => type_pref, :caretaker => caretaker, :id => id}))
    end
    customers
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO customers (name, phone, breed_pref, type_pref, caretaker) VALUES ('#{@name}', '#{@phone}', '#{@breed_pref}', '#{@type_pref}', '#{@caretaker}') RETURNING id;")
    @id = result.first().fetch("id").to_i()

  end

  define_singleton_method(:find) do |id|
    found_customer = nil
    Customer.all().each() do |customer|
      binding.pry
      if customer.id().==(id)
        found_customer = customer
      end
    end
    found_customer
  end

end
