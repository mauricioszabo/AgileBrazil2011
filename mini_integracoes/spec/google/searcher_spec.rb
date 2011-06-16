require "google/searcher"

describe Google::Searcher do
  it 'should find wikipedia\'s page' do
    stub_google
    results = subject.search_for("Wikipedia")
    results.should be_a_kind_of(String)
    results.should include("http://www.wikipedia.org")
  end

  def stub_google
    Net::HTTP.stub!(:get).and_return(File.read("spec/google.fixture"))
  end
end
