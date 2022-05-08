# 1) Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.


# class Cat
#   def self.generic_greeting
#     puts 'Hello! I am a cat!'
#   end
# end

# Cat.generic_greeting

# kitty = Cat.new

# 2)

# class Cat
# attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name

#3) class Cat
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# p kitty.identify

#4) Using the following code, add two methods: ::generic_greeting and #personal_greeting.
#The first method should be a class method and print a greeting that's generic to the class.
#The second method should be an instance method and print a greeting that's custom to the object.

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.generic_greeting
#     puts 'Hello! I\'m a cat'
#   end

#   def personal_greeting
#     puts "Hello! My name is #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')

# Cat.generic_greeting
# kitty.personal_greeting

#5) Using the following code, create a class named Cat that tracks the number of times a new Cat
# object is instantiated. The total number of Cat instances should be printed when ::total is invoked.

# class Cat
#   @@total = 0
#   def initialize
#     @@total += 1
#   end

#   def self.total
#     puts @@total
#   end
# end


# kitty1 = Cat.new
# kitty2 = Cat.new

# Cat.total

#6) Using the following code, create a class named Cat that prints a greeting when #greet is invoked.
#The greeting should include the name and color of the cat. Use a constant to define the color.

# class Cat
#   COLOR = 'purple'

#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

#7) Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "I'm #{name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# puts kitty

#8) Using the following code, create a class named Person with an instance variable named @secret.
# Use a setter method to add a value to @secret, then use a getter method to print @secret.

# class Person
#   attr_accessor :secret
# end

# #or

# class Person
#   def secret=(secret)
#     @secret = secret
#   end

#   def secret
#     @secret
#   end
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

#9) Using the following code, add a method named share_secret that prints the value of
# @secret when invoked.

# class Person
#   attr_writer :secret

#   def share_secret
#     puts secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

#10) Using the following code, add an instance method named compare_secret that compares the value of
# @secret from person1 with the value of @secret from person2.

class Person
  attr_writer :secret

  def compare_secret(person)
    self.secret == person.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)

