=begin
  KeyValueHash is a subclass of Hashable. It holds a key of Hashable type and a value.

  @author Richard Salas Chavez (7764077)
  @version August 1, 2016
=end

require_relative "Hashable"
require_relative "int_hash"
require_relative "string_hash"

class KeyValueHash < Hashable

  attr_accessor :key
  attr_accessor :value

  #constructor
  def initialize(key, value)
    if key.kind_of?(Hashable)
      @key = key # must be a Hashable type
      @value = value
    else
      raise "key must be a Hashable type"
    end
  end

  # hashvalue is the hashvalue of the key
  def hashvalue
    return @key.hashvalue
  end

  def printIt()
    print "#{@key} #{@value}"
  end

  def to_s
    return "#{@key} #{@value}"
  end

  def ==(another_hash)
    if another_hash.instance_of?(KeyValueHash)
      return self.key == another_hash.key
    else
      return super
    end
  end

end

