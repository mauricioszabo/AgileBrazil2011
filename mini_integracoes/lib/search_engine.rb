class SearchEngine
  def initialize(searcher, parser)
    @searcher, @parser = searcher.new, parser.new
  end

  def search(term)
    string = @searcher.search_for term
    string = string.force_encoding("ISO8859-1") if string.respond_to? :force_encoding
    @parser.parse string
  end
end
