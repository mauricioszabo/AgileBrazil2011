class Element
  attr_accessor :color
  def initialize
    @color = :green
  end
end

describe Element do
  let(:element) { Element.new }

  it 'should be green' do
    element.color.should be_color(:green)
  end

  RSpec::Matchers.define :be_color do |color|
    match do |element|
      element == color
    end
  end
end

