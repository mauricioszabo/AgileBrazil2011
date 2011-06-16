require File.dirname(__FILE__) + "/person"

describe Person do
  it 'should not be able to dance if not valid' do
    person = create_person :invalid
    expect { person.dance }.to raise_error
  end
  
  it 'should be able to dance if valid' do
    person = create_person :valid
    person.dance.should be_true
  end

  def create_person(status = :valid)
    person = Person.new
    person.age = if(status == :valid) then 22 else -1 end
    return person
  end
end

