Ineritance is when a class inherits behavior from another class. 
We use it to extract common behaviors from classes the share behavior and move it to a super class. Lets us keep logic in one place. 

`super` is used to call methods earlier in the method lookup path. 

`super` automatically forwards the arguments that were passed to the method from which `super` is called. 

i.e. 

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```

`super` can match up names like so: 

```ruby
class BadDog < Animal
  def initialize(age, name)
    super(name)
    @age = age
  end
end

BadDog.new(2, "bear")        # => #<BadDog:0x007fb40b2beb68 @age=2, @name="bear">
```

If you call `super` like `super()` it will call the method with no arguments. This is apparently the safest and sometimes only way to call it. 

The 2 primary ways ruby implements inheritance is class inheritance and Modules.

Extracting common methods to a superclass is great to model concepts that are naturally hierarchical. However there are inevitably exceptions -- that is where Modules come in. 

Using modules to group common behaviors allows us to build a more powerful, flexible and DRY design. 

_Note: A common naming convention for Ruby is to use the "able" suffix on whatever verb describes the behavior that the module is modeling. You can see this convention with our `Swimmable` module. Likewise, we could name a module that describes "walking" as `Walkable`. Not all modules are named in this manner, however, it is quite common._

interface inheritance: mixin modules. The class inherits the interface provided by the mixin module. 

If there is an 'is-a' relationship, probably better to use class inheritance. If there is a 'has-a' relationshpi then interface inheritance. 

Method lookup path: The order in which classes are inspected when you call a method. We can see this path by calling `ancestors`.

The order in which modules are included is important. If its listed last, its the first module in the lookup math. 

Class
Modules
Superclass
Modules in superclass
repeat

2 more uses for modules: 

A) Namespacing - organizing similar classes under a module i.e. using modules to group related classes.
This makes it 
	1) Easier for us recognize related classes in our code
	2) Reduces likelihood of our classes colliding with other similarly named classes in our codebase. 

We call classes in a module like `Module::Class` 
so `Mammal::Dog.new`. 

B) As a container for methods called module methods. Useful for methods that seem out of place for your code. 


Method Access Control
	Implemented through access modifiers. 
	In ruby, we are concerned with restricting access to methods define in a class.

Public - available to anyone who knows the class or objects name. Comprises the class interface. 

Private - doing work in the class but dont need to available to the rest of the program. Cannot be called with self. 

Every class you make inherently subclasses from `Object`. 

The one object instance method thats easily overriden without any major side-effect is `to_s`.








