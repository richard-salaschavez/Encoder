=begin
  StringHash is a subclass of Hashable. It holds an string and a hashvalue.

  @author Richard Salas Chavez (7764077)
  @version August 1, 2016
=end

require_relative "Hashable"

class StringHash < Hashable
  $P = 31 # prime number used in hashvalue
  attr_accessor :value

  # constructor
  # @param  string, value of string
  def initialize(string)
    @value = string.to_s
  end

  # @return returns hashvalue of StringHash, which is given by the expression in the assignment
  def hashvalue
    sum = 0
    @value.split('').each { |c| #using Horner's method to compute sum
      sum = (sum + c.ord) * $P
    }
    return sum/$P
  end

  # prints itself
  def printIt()
    print "#{@value} "
  end

  def ==(another_hash)
    if another_hash.instance_of?(StringHash)
      return self.value == another_hash.value
    else
      return super
    end
  end
end
