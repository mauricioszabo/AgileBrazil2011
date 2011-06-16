require "net/http"

module Google
  class Searcher
    def search_for(search)
      Net::HTTP.get URI.parse("http://www.google.com/search?q=#{search}")
    end
  end
end
