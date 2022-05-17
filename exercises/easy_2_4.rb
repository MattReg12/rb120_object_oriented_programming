#1) Write a class that will display:

# ABC
# xyz


# when the following code is run:

class Transform
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def self.lowercase(data)
    data.downcase
  end

  def uppercase
    data.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')