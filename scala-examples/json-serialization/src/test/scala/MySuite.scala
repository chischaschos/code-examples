// For more information on writing tests, see
// https://scalameta.org/munit/docs/getting-started.html
class MySuite extends munit.FunSuite {
  test("example test that succeeds") {

    val o1  = Option("Yeah")

    assert(o1 == Option("Noo"))
  }
}
