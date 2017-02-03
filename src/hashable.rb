=begin
  Hashable is an abstract class

  @author Richard Salas Chavez (7764077)
  @version August 1, 2016
=end

class Hashable

  #attr_reader :value

  # Ensures that an instance of Hashable cannot be created by raising a warning
  # @param  *args any argument
  def Hashable.new(*args)
    if self == Hashable
      raise "Hashable is an abstract class and cannot be instantiated"
    else
      super
    end
  end

  #abstract method called hashvalue
  #ensures that subclasses have a method called hashvalue by raising an exception
  def hashvalue()
    raise "Abstract Method Not Implemented in #{self}"
  end

  #returns string with its own value
  def to_s
    return "#{@value}"
  end

  # checks if integer values are equal
  def ==(another_hash)
    return false
  end
end
