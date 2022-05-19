#1) Create a sub-class from Dog called Bulldog overriding the
# swim method to return "can't swim!"

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog
  def swim
    'can\'t swim!'
  end
end


teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"


#2) Let's create a few more methods for our Dog class. Create a new
# class called Cat, which can do everything a dog can, except
# swim or fetch. Assume the methods do the exact same thing.
#Hint: don't just copy and paste all methods in Dog into Cat;
# try to come up with some class hierarchy.

class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Animal
  def speak
    'meow!'
  end
end

# What is the method lookup path and how is it important?
# When a method is called, Ruby tries to determine which, if any
# implementation of a method can be used. It first searches the class
# of the object its called on, then the modules mixed into that class
# (searching the last module included first and so on) then follows
# the same pattern up the superclass tree of the object. It is importnat
# because it is a way that Ruby implements polymorphism (overriding methods
# in a subclass or module.)

# From the answer: The method lookup path is the order in which Ruby will traverse the class hierarchy to look for methods to invoke.
