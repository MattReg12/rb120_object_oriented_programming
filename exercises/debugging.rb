class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    if valid?(api_key)
      rand(200_000)
    else
      raise AuthenticationError, 'API key is not valid.'
    end
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'XXLS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      #binding.pry
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    #rescue Exception
      #NoScore
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!

=begin
In order to test the case when authentication fails, we can simply set API_KEY
to any string other than the correct key. Now, when using a wrong API key, we want
our mock search engine to raise an AuthenticationError, and we want the find_out
method to catch this error and print its error message API key is not valid.

Is this what you expect to happen given the code?

And why do we always get the following output instead?
=end
