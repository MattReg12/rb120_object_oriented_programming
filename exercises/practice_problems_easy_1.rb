#1) All of them. call   .class

#2) If we have a Car class and a Truck class and we want to be able to go_fast,
# how can we add the ability for them to go_fast using the module Speed? How can you check if your Car
# or Truck can now go fast?

# module Speed
#   def go_fast
#     puts "I am a #{self.class} and going super fast!"
#   end
# end

# class Car
#   include Speed
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end

# class Truck
#   include Speed
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end

# Truck.new.go_fast
# Car.new.go_fast


#3 When we called the go_fast method from an instance of the Car class (as shown below)
# you might have noticed that the string printed when we go fast includes the name of the
# type of vehicle we are using. How is this done?

=begin
>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!
=end

#Calling self.class returns the name the of the class. Self refers to the instance.

#4) If we have a class AngryCat how do we create a new instance of this class?

=begin
The AngryCat class might look something like this:

class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end
=end

angry_cat = AngryCat.new

#5) The @ sign.

#8) The instance calling this method.

#9) The class

#10) Bag.new('red', 'burlap')
