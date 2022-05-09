# Consider the following classes:

class AutoMobile
  attr_reader :make, :model, :wheels

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @wheels = wheels
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < AutoMobile
end

class Motorcycle < AutoMobile
end

class Truck < AutoMobile
  attr_reader :payload

  def initialize(make, model, wheels, payload)
    super(make, moderl, wheels)
    @payload = payload
  end
end

# Refactor these classes so they all use a common superclass, and inherit behavior as needed.