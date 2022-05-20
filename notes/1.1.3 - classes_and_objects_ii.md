Class methods - Methods we call directly on the class itself without instantiation. All you need is to append `.self` to the method definition. We put functionality that does not pertain to individual objects. I.e. we have a method that does not need state. 

Technically constants only need the first letter capped, rubysists prefer all caps. 

`puts` calls `to_s` on any object except array. It calls `to_s` on each object of an array.

`p` calls `.inspect` on an object. `p` is very helpful for debugging purposes. 

The `to_s` method is also automatically called when using string interpolation. 

Per LS: 
	This fact may seem trivial at the moment, but knowing when `to_s` is called will help us understand how to read and write better OO code.

Our 2 uses of `self`  at the moment:
	A) Class methods
	B) calling setter methods within the class

From within the class, an instance method that is calling `self` returns the instance. I.e. calling self within a class via an instance method references the calling object. 

```ruby
class GoodDog
  def what_is_self
    self
  end
end
```
```ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
p sparky.what_is_self
# => #<GoodDog:0x007f83ac062b38 @name="Sparky", @height="12 inches", @weight="10 lbs">
```

i.e. calling `sparky.name` outside the class == `self.name` within the class. Calling `sparky.name` within the class does not work as `sparky` is out out scope for the class definition. 

Using `self` outside of an instance method references the actual class and not the instance. Thus that is how we define class methods. 

Ripped straight from book: 
	To be clear, from within a class...

1.  `self`, inside of an instance method, references the instance (object) that called the method - the calling object. Therefore, `self.weight=` is the same as `sparky.weight=`, in our example.
    
2.  `self`, outside of an instance method, references the class and can be used to define class methods. Therefore if we were to define a `name` class method, `def self.name=(n)` is the same as `def GoodDog.name=(n)`.


Exercise 1: Add a class method to your MyCar class that calculates the gas mileage of any car.

```ruby
def self.gas_mileage(mpg, gallons_in_tank)
  mpg * gallons_in_tank
end
```

Exercise 2: Override the to_s method to create a user friendly print out of your object.

```ruby
def to_s

"This is a #{color} #{year} #{model}."

end
```

Exercise 3: 
When running the following code...

```ruby
class Person 
  attr_reader :name 
  
  def initialize(name) 
    @name = name 
  end 
end 

bob = Person.new("Steve") 
bob.name = "Bob"
```

Why do we get an error and how do we fix it?

Change to attr_accessor. 

