class A
  def bye
    "bye"
  end
end

class B < A
end


puts B.new.bye

module Houses
  class Tell
    def do
      "saying"
    end
  end

  class Red
    def tell
      tell_class.new.do
    end

    def tell_class
      Tell
    end
  end
end

module Cars
  class Tell
    def do
      "saying cars"
    end
  end

  class Red < Houses::Red
    def tell_class
      Tell
    end
  end
end

puts Cars::Red.new.tell
