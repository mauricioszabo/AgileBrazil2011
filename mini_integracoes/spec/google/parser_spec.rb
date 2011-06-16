require "google/parser"

describe Google::Parser do

  it 'should parse the google page and return an hash' do
    hash = subject.parse(google_results)
    hash.should be_a_kind_of(Hash)
    hash.should include('http://www.wikipedia.org/')
    hash['http://www.wikipedia.org/'].should == "Wikipedia"
  end

  def google_results
    res = File.read("spec/google.fixture")
    res = res.force_encoding("ISO8859-1") if res.respond_to? :force_encoding
    return res
  end
end
