Rubocop does a great job of recognizing overly complex methods. Take a look at them when it complains. 

The goal is to write code that is simple, easy to read, easy to maintain, and works. 

ABC cop counts the assignments, branches (method calls), and conditions in a method then turns it into a single metric that describes the complexity. 

```ruby
  abc_size = Math.sqrt(a**2 + b**2 + c**2)`
```

If this is greater than 18, it complains. 

To work on it, focus on the component with the greatest count. 

The point is:
	try to simplify your code, 
	examine the results, 
	use your best judgement


