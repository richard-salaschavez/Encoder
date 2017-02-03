=begin
  singleton.rb
  COMP 2150  Object Orientation
  (C) Computer Science, University of Manitoba
=end

class OnlyOne
  private_class_method :new
  attr_accessor  :x
  def initialize
    @x=1
  end

  def OnlyOne.create(*args)
    @@inst = new(*args) unless defined?(@@inst) #unless acts as a guard!
    return @@inst
  end
  def test
    puts "in my only instance!"
  end
end # class OnlyOne

x = OnlyOne.create()
puts x.x
y=OnlyOne.create()
y.x = 3 #note this is actually calling a mutator!
puts x.x  #output is 3 - changing x in y is changing x for the ONLY instance

