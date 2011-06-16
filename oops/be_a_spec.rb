class ClassName
end

describe ClassName do
  it 'should return a new class' do
    ClassName.new.should be_a(ClassName)
  end
end
