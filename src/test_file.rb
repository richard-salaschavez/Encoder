=begin
  TestFile will run the Unit Tests

  @author Richard Salas Chavez (7764077)
  @version August 5, 2016
=end

require_relative "hash_table"
require_relative "int_hash"
require_relative "string_hash"
require "test/unit"

class TestFile < Test::Unit::TestCase

  # testing that the hashtable is actually empty
  def test_empty
    hashtable = HashTable.new(5) # empty hashtable
    assert_equal(hashtable.isEmpty?, true)
  end

  # removing an item when there is only one item on the list
  def test_one_item
    hashtable = HashTable.new(5)
    int = IntHash.new(13)
    hashtable.add(int)
    assert_equal(hashtable.remove(int), true)
  end

  # tests for invalid data in the arguments
  def test_invalid_data
    hashtable = HashTable.new(5) # empty hashtable
    assert_raise (ArgumentError){hashtable.add(5)}
  end

  # checks that the contains method works with many values in hashtable
  def test_contains?
    hashtable = HashTable.new(5)
    int = IntHash.new(6)
    str = StringHash.new("Richard")
    key_val = KeyValueHash.new(str, int)

    hashtable.add(int)
    hashtable.add(str)
    hashtable.add(key_val)

    assert_equal(hashtable.contains?(key_val), true)
  end

end