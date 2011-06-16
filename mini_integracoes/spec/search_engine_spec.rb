require "search_engine"
require "google/searcher"
require "google/parser"

describe SearchEngine do
  let(:google) { SearchEngine.new(Google::Searcher, Google::Parser) }

  it 'should be able to find Wikipedia\'s site' do
    stub_google
    results = google.search("Wikipedia")
    results.should include('http://www.wikipedia.org/')
    results['http://www.wikipedia.org/'].should == "Wikipedia"
  end

  def stub_google
    Net::HTTP.stub!(:get).and_return(File.read("spec/google.fixture"))
  end
end
