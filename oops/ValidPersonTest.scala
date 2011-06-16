import org.scalatest.FlatSpec
import org.scalatest.matchers._
import xml._

class ValidPersonTest extends FlatSpec with ShouldMatchers {
    it should "be a valid person" in {
        person.name should be === ("Ariovaldo")
        person.surname should be === ("Steil")
        person.age should be === (28)
    }

    def person = new Person("Ariovaldo", "Steil", 28)

    class Person(_name: String, _surname: String, _age: Int) {
        val name=_name
        val surname=_surname
        val age=_age
    }
}
