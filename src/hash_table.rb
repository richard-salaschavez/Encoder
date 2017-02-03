=begin
  HashTable implements a hash table using an array.

  @author Richard Salas Chavez (7764077)
  @version August 5, 2016
=end


require_relative "list"
require_relative "hashable"
require_relative "int_hash"
require_relative "key_value_hash"

class HashTable
  attr_reader :array

  # constructor
  def initialize(size)
    @size = size.to_i
    @items = 0
    @array = Array.new(size, List.new)
  end

  # takes a Hashable object x and adds it to the HashTable in the appropiate
  # position.
  def add(x)
    if (x.kind_of?(Hashable))
      pos = position(x)

      @array[pos].insert(x) # add it to the hash table, should I add x or hash?
      #return nil #do we need to put this in or is it set by default
      @items += 1
    else
      raise ArgumentError, "Argument not of type Hashable"
    end
  end

  # takes a Hashable object x and returns the first occurrence of x in the hash table.
  # If the element does not exist, the method should raise an error.
  def get(x)
    if (x.kind_of?(Hashable))
      # get the objects key
      pos = position(x) # get key
      found = @array[pos].get(x) # look in key
      if (found.to_s == nil)
        raise RuntimeError, "Element does not exist"
      else
        return found # returns object in hash table
      end
    else
      raise ArgumentError, "Argument not of type Hashable"
    end
  end

  # takes a Hashable object and deletes one occurrence of x in the hash table
  # if the element doesn't exist then the method should leave the table unchanged
  # @return a boolean indicating whether or not an element was removed or not
  def remove(x)
    if (x.kind_of?(Hashable))
      pos = position(x)
      if @array[pos].remove(x) # if true
        @items -= 1 # subtract one item
        return true
      else
        return false
      end
    else
      raise ArgumentError, "Argument not of type Hashable"
    end
  end

  # takes a Hashable object, x, and determines if it is in the hash table.
  def contains?(x)
    if (x.kind_of?(Hashable))
      pos = position(x)
      found = @array[pos].get(x)
      if (found.instance_of?(NilClass))
        return false
      else
        return true
      end
    else
      raise ArgumentError, "Argument not of type Hashable"
    end
  end

  # checks if array is empty, and if it is empty it returns true, otherwise it returns false
  def isEmpty?()
    return @items == 0
  end

  # the position of the element in the table will be its hash code modulo the length of the array
  def position(x) #x will be the Hashable object
      return x.hashvalue % @size
  end

  def printIt
    @array.each do |i|
      i.printIt
    end
  end
end
