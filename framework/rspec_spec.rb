class MyTestFramework
  attr_reader :qualities
  def initialize
    @qualities = [:extensible, :clean, :fast]
  end

  def rigid?
    @qualities.include? :rigid
  end
end

describe MyTestFramework do
  let(:framework) { MyTestFramework.new }

  it 'should be extensible' do
    framework.should be_extensible
  end

  it 'should not be rigid' do
    framework.rigid?.should == false
    framework.rigid?.should_not be_true
    framework.should_not be_rigid
    framework.should have_at_least(3).qualities
    framework.should be_flexible
  end

  RSpec::Matchers.define :be_extensible do
    match { |framework| framework.qualities.include? :extensible }
  end

  RSpec::Matchers.define :be_flexible do
    match { |framework| !framework.qualities.include?(:rigid) }
  end
end
