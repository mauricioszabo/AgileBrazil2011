class Person
  attr_accessor :age

  def dance
    return true if age > 0
    raise ArgumentError, 'age must be greater than 0'
  end
end
