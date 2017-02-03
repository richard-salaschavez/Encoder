=begin
  Encoder encodes a text file using LZW encoding.

  @author Richard Salas Chavez (7764077)
  @version August 5, 2016
=end

require_relative "dictionary"
require_relative "string_hash"
require_relative "key_value_hash"

class Encoder

  # constructor
  # constructor
  # prefills dictionary
  # calls encode function
  # @param filename, name of input file
  def initialize(filename)
    @lzw_encoding = 0
    # create a dictionary that associates numerical values with each single
    # character. Encoding all printable ascii character from 32 to 126
    @dictionary = Dictionary.new
    (32..126).each do |i|
      @dictionary.put(StringHash.new(i.chr.to_s), @lzw_encoding)
      @lzw_encoding += 1
    end

    encode(filename)
  end

  # open a new output file
  # open the input file
  # write codes for the LZW algorithm to the output file
  def encode(filename)
    count = 1
    File.open(filename, 'r') do |input|
      File.open(filename << ".lzw", 'w') do |out|
        while char = input.getc # get character from line
          curr_key_str = ""
          curr_key_str << char
          #input.ungetc(char)

          curr_key = KeyValueHash.new(StringHash.new(curr_key_str), 1)

          while @dictionary.contains?(curr_key)
            curr_key.key.value.strip
            last_key = KeyValueHash.new(StringHash.new(curr_key_str), 1)

            if char2 = input.getc
              curr_key_str += char2
              curr_key = KeyValueHash.new(StringHash.new(curr_key_str), 1)

            else
              break
            end
          end
          print "#{count}. curr_key = \"#{curr_key_str}\", last_key = \"#{last_key.key}\". OUTPUT = #{@dictionary.get(last_key)}, "
          print "Add to dictionary: #{curr_key.key}:#{@lzw_encoding}"
          puts
          count += 1
          @dictionary.put(curr_key.key, @lzw_encoding) # add curr_key to the dictionary with a new lzw encoding value
          @lzw_encoding += 1

          out.write("#{@dictionary.get(last_key).to_i} ") # outputs value in the dictionary for last key
          input.ungetc(char2) # put the last char of the input back
        end
      end
    end
  end
end

encode = Encoder.new("test_input.txt")