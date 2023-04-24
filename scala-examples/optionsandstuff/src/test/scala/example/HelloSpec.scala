package example

class HelloSpec extends munit.FunSuite {
  test("comparing option, some, none") {
    val o1  = Option("Yeah")

    assert(o1 != Option("Noo"))
    assert(o1 != "Noo") // warning
    assert(o1 == Option("Yeah"))

    val s1 = Some("Yeah")

    assert(s1 == o1) // What!!!
    assert(s1 != "Yeah") // warning
    assert(s1 != Option("Noo"))
    assert(s1 != None) // warning


    val ns1 = Some(s1)

    assert(ns1 != o1)
    assert(ns1 != s1)
    assert(ns1 == Some(Some("Yeah")))
    assert(ns1 != Some(Some("Noo")))
  }

  test("mapping option, some, none") {
    val o1 = Option("Yeah")
    assert(o1.get == "Yeah")

    val s1 = Some("Yeah")
    assert(s1.get == "Yeah")

    val n1 = None
    // assert(n1.get == "Yeah") does not compile

    val no1 = Option(Option("Yeah"))
    val no2 = Option(Some("Yeah"))
    val no3 = Option(None)

    assert(no1.get.get == "Yeah")
    assert(no2.get.get == "Yeah")
    // assert(no3.get.get == "Yeah") // does not compile

    // Notice that the following ones print the object not just the contained string
    assertEquals(no1.map(_.toString).getOrElse("ELSE"), "Some(Yeah)") // What!!!
    assertEquals(no2.map(_.toString).getOrElse("ELSE"), "Some(Yeah)") // What!!!
    assertEquals(no3.map(_.toString).getOrElse("ELSE"), "None") // What!!!

    assertEquals(no1.getOrElse(None).getOrElse("ELSE"), "Yeah") // What!!!
    assertEquals(no2.getOrElse(None).getOrElse("ELSE"), "Yeah") // What!!!
    assertEquals(no3.getOrElse(None).getOrElse("ELSE"), "ELSE") // What!!!


    assertEquals(no1.foldLeft("ELSE")((folded, option) => option.getOrElse(folded)), "Yeah") // What!!!
    assertEquals(no2.foldLeft("ELSE")((folded, option) => option.getOrElse(folded)), "Yeah") // What!!!
    assertEquals(no3.foldLeft("ELSE")((folded, option) => option.getOrElse(folded)), "ELSE") // What!!!
  }
}
