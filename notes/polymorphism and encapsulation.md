**polymorphism** refers to the ability of different data types to respond to the same interface. i.e. different object types refer to the same method invocation. This leads to more maintainable code. 

2 chief ways to implement polymorphism:
1) Inheritance: Method overriding is generally treated as an aspect of inheritance. 

2)  Duck typing - when object of different, unrelated types both respond to the same method name. We only care if the object has a particular behavior. If an object quacks like a duck, then we can treat it like a duck. This is a type of polymorphism. 

Helpful example from text: 
	For example, an application may have a variety of elements that can respond to a mouse click by calling a method named something like `handleClick`. Those elements may be completely different -- for instance, a checkbox vs. a text input field -- but they're all _clickable_ objects. Duck typing is an informal way to classify or ascribe a type to objects. Classes provide a more formal way to do that.

In practice, polymorphic methods are intentionally designed to be polymorphic. If there is no intention, you prolly shouldnt use them in that manner. 

**encapsulation** lets us hide the internal representation of an object from the outside and only expose the methods and properties that users of the object need. 

We use method access control to achieve this. 

An exception to `private` is when you need to use `self` to call private setter methods. 

-- A class should have as few public methods as possible. It lets us simplify that class and protect data from undesired changes from the outer world. 

Classes group common behavior and instances encapsulate state. 