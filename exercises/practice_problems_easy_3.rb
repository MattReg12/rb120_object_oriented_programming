#1) What happens in each of the following cases:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#A)
hello = Hello.new
hello.hi

#B)
hello = Hello.new
x = hello.bye rescue 'you are right'
puts x

#C)
hello = Hello.new
#hello.greet



#D)
hello = Hello.new
hello.greet("Goodbye")

#E)
Hello.hi
