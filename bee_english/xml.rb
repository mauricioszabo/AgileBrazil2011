module XML
  module String
    def converted_to(format)
      "<person><name>Ariovaldo Steil</name><age>22</age></person>"
    end
  end
end

String.send :include, XML::String
