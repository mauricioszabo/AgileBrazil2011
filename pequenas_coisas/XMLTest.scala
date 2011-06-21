import org.scalatest.FlatSpec
import org.scalatest.matchers._
import scala.xml._

class XMLTest extends FlatSpec with ShouldMatchers {
    it should "return only 2 people" in {
        xml should have(2).tags("person")
    }

    def xml = <people><person>Ariovaldo</person><person>Angelona</person></people>

    def have(count: Int) = new TagsMatcher(count)
    class TagsMatcher(count: Int) {
        def tags(tagName: String) = new Matcher[Seq[scala.xml.Node]] {
            def apply(xml: Seq[scala.xml.Node]) = MatchResult(
                (xml \ tagName).size == count,
                "expected " + xml + " to have " + count + " <" + tagName + "> tags",
                "expected " + xml + " not to have " + count + " <" + tagName + "> tags"
            )
        }
    }
}
