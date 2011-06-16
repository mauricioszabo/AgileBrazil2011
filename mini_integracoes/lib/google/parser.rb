require "nokogiri"

module Google
  class Parser
    def parse(string)
      xml = Nokogiri.parse string
      results = xml.css(".r")
      results.inject({}) do |hash, result|
        href = result.css("a")[0]["href"]
        text = result.css("em").inner_html
        hash.merge(href => text)
      end
    end
  end
end
