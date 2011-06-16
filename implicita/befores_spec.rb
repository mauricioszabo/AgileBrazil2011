require File.dirname(__FILE__) + "/person"

describe Person do
  before { @person = Person.new }

  context 'invalid' do
    before { @person.age = -1 }

    it 'should not be able to dance' do
      expect { @person.dance }.to raise_error
    end
  end

  context 'valid' do
    before { @person.age = 22 }
    it 'should be able to dance' do
      @person.dance.should be_true
    end
  end
end
