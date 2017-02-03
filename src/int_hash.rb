=begin
  IntHash is a subclass of Hashable. It holds an interger and a hashvalue.

  @author Richard Salas Chavez (7764077)
  @version August 1, 2016
=end

require_relative "Hashable"

class IntHash < Hashable

  attr_reader :value

  # constructor
  # @param  intVal, initial value of interger
  def initialize(intVal)
    @value = intVal.to_i
  end

  # @return returns hashvalue of IntHash, which is the value of the interger, @value
  def hashvalue
    return @value.to_i #value of the interger
  end

  # prints its value
  def printIt()
    print "#{@value} "
  end

  def ==(another_hash)
    if another_hash.instance_of?(IntHash)
      return self.value == another_hash.value
    else
      return super
    end
  end
end
