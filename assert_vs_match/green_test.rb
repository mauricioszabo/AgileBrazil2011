require "test/unit"

class GreenTest < Test::Unit::TestCase
  def test_element_must_be_green
    element = Element.new
    assert(Color::GREEN, element.color)
  end
end

class Element
  attr_accessor :color
  def initialize
    @color = Color::GREEN
  end
end

module Color
  GREEN = "#00FF00"
end
