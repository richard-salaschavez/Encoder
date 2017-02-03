=begin
  Implements dictionary by containing hashtable.

  @author Richard Salas Chavez (7764077)
  @version August 5, 2016
=end

require_relative "key_value_hash"
require_relative "hash_table"

class Dictionary
  $SIZE = 1000 # size of dictionary

  # constructor
  def initialize
    @hashtable = HashTable.new($SIZE)
  end

  # takes a Hashable key k and returns the value v associated with it,
  # if it is in the dictionary. Raises an error if the key is not in the dictionary.
  # @param k = key value (Hashable), v = value
  def put(k,v)
    found = @hashtable.get(k)
    if (found.instance_of?(NilClass)) # if the key does not exists in the dictionary
      @hashtable.add(KeyValueHash.new(k,v))# add it to the dictionary
    else# (@hashtable.contains?(k)) # if it does exist
      @hashtable.get(k).value = v # replace old value with new value v
    end
  end

  # takes a Hashable key k and returns the value v associated with it, if
  # it appears in the dictionary. Raises and error if the key k is not in
  # the dictionary
  # @param k = keyvalue (Hashable)
  def get(k)
    if @hashtable.contains?(k)
      return @hashtable.get(k).value # return value v
    else # raise an error
      raise "Error, key not found in dictionary"
    end
  end

  # takes a Hashable key x and determines if it is a key in the dictionary
  # returns a boolean value
  def contains?(x)
    return @hashtable.contains?(x)
  end

  # returns a boolean depending on whether the dictionary is empty or not
  def isEmpty?
    return @hashtable.isEmpty?
  end

end
