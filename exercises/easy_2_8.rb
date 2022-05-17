# What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = expand(string)
  end

  def to_s
    @string
  end

  private

  def expand(string)
    string * 3
  end
end

expander = Expander.new('xyz')
puts expander