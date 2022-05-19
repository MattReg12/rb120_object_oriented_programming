#1)

# Given the below usage of the Person class, code the class definition

# class Person
#   attr_accessor :last_name, :first_name

#   def initialize(name, last_name = '')
#     @name = name
#     @first_name = name.split.first
#     @last_name = last_name
#   end

#   def name
#     "#{first_name} #{last_name}"
#   end
# end


# bob = Person.new('bob')
# p bob.name                  # => 'bob'
# bob.name = 'Robert'
# p bob.name                  # => 'Robert'

#2) Modify the class definition from above to facilitate the
#following methods. Note that there is no name= setter method now.

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# p bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# class Person
#   attr_accessor :last_name, :first_name

#   def initialize(name, last_name = '')
#     @name = name
#     @first_name = name.split.first
#     @last_name = last_name
#   end

#   def name
#     "#{first_name} #{last_name}"
#   end
# end

#3) Now create a smart name= method that can take just a first
# name or a full name, and knows how to set the first_name and
#last_name appropriately.

class Person
  attr_accessor :last_name, :first_name

  def initialize(name)
    parse_full_name(name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(name)
    parse_full_name(name)
  end

  def ==(person)
    self.name == person.name
  end

  private

  def parse_full_name(name)
    parts = name.split
    self.first_name = parts.first
    self.last_name = parts.size > 1 ? parts.last : ''
  end
end

# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# p bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# p bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob == rob
