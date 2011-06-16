require File.dirname(__FILE__) + "/xml"

describe XML do
  it 'should convert a YAML-like structure to XML' do
    string = "
    person:
      name: Ariovaldo Steil
      age: 22
    "
    xml = string.converted_to(:xml)
    xml.should have_tag :person do
      with_tag(:age).value(22) and
      with_tag(:name).value("Ariovaldo Steil")
    end
  end

  def have_tag(tag)
    XMLMatcher.new tag
  end
end

class XMLMatcher
  def initialize(tag)
    @tag = tag
  end

  def matches?(string, &block)
    if block
      match = string.scan(/<#@tag>(.*)<\/#@tag>/)
      return false if match.empty?
      string = match.join
      TagMatcher.new(string).instance_eval &block
    else
      string =~ /<#{@tag}>/
    end
  end

  def failure_message
    "Expected to have tag #@tag"
  end
end

class TagMatcher
  def initialize(string)
    @string = string
  end

  def with_tag(tag)
    match = @string.scan /<#{tag}>(.*)<\/#{tag}>/
    return false if match.empty?
    return TagMatcher.new(match.join)
  end

  def value(value)
    @string == value.to_s
  end
end
