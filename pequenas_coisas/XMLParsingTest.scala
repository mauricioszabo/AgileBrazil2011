import org.scalatest.FlatSpec
import org.scalatest.matchers._
import scala.xml._

class XMLParsingTest extends FlatSpec with ShouldMatchers {
    it should "get the correct number of people on XML" in {
        (XML.loadString(xml) \ "person").size should be === (2)
    }

    it should "get the correct number of people" in {
        xml should have(2).tags("person")
    }

    def xml = """
    <people>
        <person>Ariovaldo Steil</person>
        <person>Ariovaldo Gumercindo</person>
    </people>
    """

    def have(count: Int) = new TagMatcher(count)
    
    class TagMatcher(count: Int) {
        def tags(tag: String) = new Matcher[String] {
            def apply(xmlString: String) = {
                val xml = XML.loadString(xmlString)
                val elements = xml \ tag
                MatchResult(
                    elements.size == count,
                    "expected to have " + count + " <" + tag + "> tags",
                    "expected to not have " + count + " <" + tag + "> tags"
                )
            }
        }
    }
}
