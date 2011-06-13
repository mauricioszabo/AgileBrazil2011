require "exemplo"

describe Exemplo do
  let(:example) { Exemplo.new }

  it 'should render a image' do
    example.image(:jpg).should match(/JFIF/)
    example.image(:jpg).should be_a_jpeg_image
  end

  Spec::Matchers.define(:be_a_jpeg_image) { match { |string| string =~ /JFIF/ } }
end
