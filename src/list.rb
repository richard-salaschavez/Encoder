require_relative "Hashable"
#require_relative "int_hash"

class Node

  attr_reader :link, :theItem
  attr_writer :link

  def initialize(initItem, initLink)
    @theItem = initItem
    @link = initLink
  end

  def printIt
    @theItem.printIt
    if (@link != nil)
      @link.printIt
    end
  end
end

class List < Hashable
  attr_reader :top
  def initialize()
    @top = nil
  end

  def insert(newItem)
    @top = Node.new(newItem,@top)
  end

  #look for item in list
  def get(item)
    current = @top
    found = nil
    pos = nil
    while (current != nil)
      if (current.theItem == item) # need to define == method in hashable classes
        found = current.theItem
        break
      end
      current = current.link
    end
    return found
  end

  #removes first instance of item if found in list
  def remove(item)
    prev = @top
    current = @top

    found = false
    while (current != nil)
      if (current.theItem == item)
        found = true
        prev.link = current.link
        break
      end
      prev = current
      current = current.link
    end
    return found
  end

  def printIt
    print "("
    if (@top != nil)
      @top.printIt
    end
    print ")"
    puts
  end
end
