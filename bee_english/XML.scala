object xml {
    implicit def string2XML(string: String) = new {
        def convertedTo(format: Symbol) = {
            "<person><name>Ariovaldo Steil</name><age>22</age></person>"
        }
    }
}

