When defining a class we typically focue on state and behavior. 

States - Track attributes for individual objects. Instance variables.

Behaviors - What objects are capable of doing. Instance methods. 

Calling the `new` class method eventually leads us to the instance method `initialize`. 

Constructor method - A special method that builds the object when a new object is instantiated. 

Instance variables live on until the object is destroyed. 

Looks like a RB129 explanation: 
	Here, the string "Sparky" is being passed from the `new` method through to the `initialize` method, and is assigned to the local variable `name`. Within the constructor (i.e., the `initialize` method), we then set the instance variable `@name` to `name`, which results in assigning the string "Sparky" to the `@name` instance variable.
	
	sparky = GoodDog.new("Sparky")

A `NoMethodError` is when a method doesnt exist or is not available to the calling object. 

For RB129: setter syntax --- syntactic sugar. 

Setter methods always return the value that is passed in as an argument. If the method tries to return anything else, it will be ignored. 

Because getters/setters are so commonplace and take up a lot of room, we have the attr_ methods. 



