The `terminfo` gem has a method called  `.screen_size`  that will return the number of columns and screenwidth in an array `[columns, screen_width]`.

It's generally safer to use an explicit `self.` caller when you have a setter method unless you have a good reason to use the instance variable directly. We say that calling the setter method, if available, is safer since using the instance variable bypasses any checks or operations performed by the setter.

For instance, consider what would happen if our setter method looked like this:

```ruby
def mileage=(miles)
  @mileage = miles.to_i
end
```

When you use the setter method elsewhere in your class, you're guaranteed that it will try to apply `#to_i` to the value. If you don't use the setter, you may set the mileage to a string value.

`super` method calls the superclass implementation of the current method. 

Due to these issues, you'll often find in our text (and external literature) that the term 'attributes' in Ruby is used quite loosely and is generally approximated as _instance variables_.