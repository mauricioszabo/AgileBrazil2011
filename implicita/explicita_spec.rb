require File.dirname(__FILE__) + "/person"

describe Person do
  it 'should not be able to dance if not valid' do
    person = Person.new
    person.age = -1
    expect { person.dance }.to raise_error
  end
  
  it 'should be able to dance if valid' do
    person = Person.new
    person.age = 22
    person.dance.should be_true
  end
end
