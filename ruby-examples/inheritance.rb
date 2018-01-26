class A
  def bye
    "bye"
  end
end

class B < A
end


puts B.new.bye
