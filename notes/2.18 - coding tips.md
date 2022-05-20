**EXPLORE THE PROBLEM BEFORE DESIGN**

take time to explore the problem domain with a spike. exploratory code to play around with the problem. This can help validate initial hunches. The idea is throw away the code. If this were an essay, it would be akin to an initial brain dump. Once you start to get a better feel for things, start to organize your code into coherent classes and methods. 

**REPETITIVE NOUNS IN METHOD NAMES IS A SIGN YOURE MISSING A CLASS**

```ruby
human.make_move
computer.make_move

puts "Human move was #{format_move(human.move)}."
puts "Computer move was #{format_move(computer.move)}."

if compare_moves(human.move, computer.move) > 1
  puts "Human won!"
elsif compare_moves(human.move, computer.move) < 1
  puts "Computer won!"
else
  puts "It's a tie!"
end
```

**DONT INCLUDE CLASS NAMES IN METHODS**

**AVOID LONG METHOD INVOCATION CHAINS**


One of the biggest mistakes beginner programmers make is mis-application of "best practices" or "design patterns" to improve performance or flexibility. This is such a common phenomenon that experienced programmers have a quote: "premature optimization is the root of all evil".

Don't worry about optimization at this point. Don't write overly clever code. Granted, you won't know what's considered "clever" vs "normal" without reading a lot of code, but over time, you will start to hone your senses.

You'll spend the rest of your career mastering design patterns and best practices. Most importantly, you should spend time understanding _when_ to use those things.