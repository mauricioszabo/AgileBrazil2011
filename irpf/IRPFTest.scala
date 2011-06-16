import org.scalatest.FlatSpec
import org.scalatest.matchers._
import xml._

class IRPFTest extends FlatSpec with ShouldMatchers {
    it should "raise error in IRPF calculation if invalid" in {
        val person = new Person()
        person.salary = -1
        evaluating { person.irpf } should produce [InvalidPerson]
    }

    it should "calculate IRPF if valid" in {
        val person = new Person()
        person.salary = 4000
        (person.irpf) should be === (1000)
    }

    it should "calculate IRPF only if valid" in {
        validPerson.irpf should be === (1000)
        evaluating { invalidPerson.irpf} should produce [InvalidPerson]
    }
    def validPerson = {
        val p = new Person()
        p.salary = 4000
        p
    }
    def invalidPerson = {
        val p = new Person()
        p.salary = -1
        p
    }

    class Person {
        var salary = 0

        def irpf = if(salary < 0)
            throw new InvalidPerson()
            else salary * 0.25
    }

    class InvalidPerson extends Exception
}
