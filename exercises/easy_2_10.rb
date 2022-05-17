module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end


class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def walk
    title + ' ' + super
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk

#byron.name
#=> "Byron"
#byron.title
#=> "Lord"