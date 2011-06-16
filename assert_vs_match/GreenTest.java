import org.junit.*;
import static org.junit.Assert.*;

public class GreenTest {
    public void elementMustBeGreenTest() {
        Element element = new Element();
        assertEquals(Color.GREEN, element.getColor());
    }

    class Element {
        private int color;
        public Element() { color = Color.GREEN; }
        public int getColor() { return color; }
    }
}
