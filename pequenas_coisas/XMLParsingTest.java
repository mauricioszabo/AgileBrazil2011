import org.junit.*;
import static org.junit.Assert.*;
import org.hamcrest.*;
import static org.hamcrest.CoreMatchers.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import java.io.*;

public class XMLParsingTest {
    @Test public void getTheCorrectNumberOfPeopleOnXML() throws Exception {
        DocumentBuilderFactory docBuilderF = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docBuilderF.newDocumentBuilder();
        Document doc = docBuilder.parse(new ByteArrayInputStream(xml().getBytes()));
        assertThat(doc.getElementsByTagName("person").getLength(), is(2));
    }

    @Test public void getTheCorrectNumberOfPeople() throws Exception {
        assertThat(xml(), have(2).tags("person"));
    }

    private TagMatcher have(int count) {
        return new TagMatcher(count);
    }

    class TagMatcher {
        private int count;
        public TagMatcher(int count) { this.count = count; }

        public Matcher<String> tags(final String tagName) {
            return new BaseMatcher<String>() {
                public void describeTo(Description d) { 
                    d.appendText("to have " + count + " <" + tagName + "> tags"); 
                }

                public boolean matches(Object xmlObj) {
                    try {
                        String xml = (String) xmlObj;
                        DocumentBuilderFactory docBuilderF = DocumentBuilderFactory.newInstance();
                        DocumentBuilder docBuilder = docBuilderF.newDocumentBuilder();
                        Document doc = docBuilder.parse(new ByteArrayInputStream(xml.getBytes()));
                        return doc.getElementsByTagName(tagName).getLength() == count;
                    } catch(Exception e) {
                        return false;
                    }
                }
            };
        }

    }

    private String xml() {
      return "<people><person>Ariovaldo Steil</person>" +
        "<person>Ariovaldo Gumercindo</person></people>";
    }
}
