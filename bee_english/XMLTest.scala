import org.scalatest.FlatSpec
import org.scalatest.matchers._
import xml._

class XMLTest extends FlatSpec with ShouldMatchers {
    it should "convert a YAML-like structure to XML" in {
        val string = """
        person:
          name: Ariovaldo Steil
          age: 22
        """
        val xml = string.convertedTo('xml)
        xml should haveTag ('person)(inside =>
            inside.shouldHaveTag('age).value("22") &&
            inside.shouldHaveTag('name).value("Ariovaldo Steil")
        )
    }
    
    def haveTag(tag: Symbol)(block: (TagMatcher) => Boolean) = new XMLMatcher(tag)(block)
    class XMLMatcher(tag: Symbol)(block: (TagMatcher) => Boolean) extends Matcher[String] {
        def apply(xml: String) = {
            val regex = ("<" + tag.name + ">(.*)</" + tag.name).r.findAllIn(xml)
            val res = ( (a: Boolean) => MatchResult(
                a, "Expected to have tag " + tag.name, "Expected not to have tag " + tag.name
            ))
            if(!regex.hasNext) res(false)
            else res(block(new TagMatcher(regex.group(1))))
        }
    }

    class TagMatcher(xml: String) {
        def shouldHaveTag(stag: Symbol) = {
            val tag = stag.name
            val regex = ("<"+tag+">(.*)</"+tag+">").r.findAllIn(xml)
            if(!regex.hasNext) new TagMatcher(null)
            else new TagMatcher(regex.group(1))
        }

        def value(value: String) = value == xml
    }
}
