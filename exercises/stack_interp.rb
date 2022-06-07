class InvalidTokenError < StandardError
  def initialize(token)
    super("Invalid Token: #{token}")
  end
end

class EmptyStackError < StandardError
  def initialize
    super('Empty Stack!')
  end
end

class Minilang
  VALID_TOKENS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
  POP_OPERATIONS = %w(ADD SUB MULT DIV MOD POP)

  POP_OPS = POP_OPERATIONS
  private_constant :POP_OPS

  def initialize(input)
    @register = 0
    @stack = []
    @tokens = tokenize(input)
  end

  def tokenize(input)
    input.split.map do |token|
      if integer?(token)
        token.to_i
      else
        raise InvalidTokenError, token unless VALID_TOKENS.include?(token)
        token
      end
    end
  end

  def eval
    tokens.each do |instrux|
      raise EmptyStackError if stack.empty? && POP_OPS.include?(instrux)
      case instrux
      when Integer then self.register = instrux
      when 'PUSH' then self.stack << register
      when 'PRINT' then puts register
      when 'ADD' then self.register += stack.pop
      when 'SUB' then  self.register -= stack.pop
      when 'MULT' then self.register *= stack.pop
      when 'DIV' then self.register /= stack.pop
      when 'MOD' then self.register %= stack.pop
      when 'POP' then self.register = stack.pop
      end
    end
    register
  end

  private

  def integer?(token)
    token.to_i.to_s == token
  end

  attr_accessor :register, :stack
  attr_reader :tokens
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

#Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

#Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
