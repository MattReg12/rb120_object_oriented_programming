# What output does this code print? Fix this class so that there are no surprises
# waiting in store for the unsuspecting developer.

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# We are calling a destructive upcase in the to_s method on the object that local variable
# name and instance variable @name point to. We probably dont want to do that.


# What would happen in this case? This code "works" because of that mysterious to_s call in
# Pet#initialize. However, that doesn't explain why this code produces the result it does. Can you?

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name
p fluffy.inspect

# Yah. 3 things, reassignment is not a mutating operation and there integers are non-mutable.
# Plus after the .to_s call in initialize, name and @name ref different objects.