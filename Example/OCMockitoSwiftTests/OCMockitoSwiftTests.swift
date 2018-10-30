import Quick
import Nimble
import OCHamcrest
import OCMockitoSwift

class OCMockitoSwiftSpec: QuickSpec {
    override func spec() {

        describe("OCMockitoSwift") {

            describe("mocking protocol") {

                var testMock: TestProtocol!

                beforeEach {
                    testMock = OCMockitoSwift.mockProtocol(TestProtocol.self) as? TestProtocol
                }

                describe("verifying public interface method") {

                    context("without arguments") {

                        context("when there was interaction with mock") {
                            beforeEach {
                                testMock.doSomethingNoArguments()
                            }
                            it("should NOT throw an exception") {
                                verify(testMock) { #selector(TestClass.doSomethingNoArguments) }
                            }
                        }

                        context("when there was NO interaction with mock") {

                            var capturedError: Error?

                            beforeEach {
                                do {
                                    try ObjectiveCException.catch {
                                        verify(testMock) { #selector(TestClass.doSomethingNoArguments) }
                                    }
                                } catch (let error) {
                                    capturedError = error
                                }
                            }

                            it("should throw an exception") {
                                expect(capturedError).notTo(beNil())
                            }
                        }
                    }

                    context("with arguments") {

                        context("only class type") {
                            context("when there was interaction with mock") {
                                beforeEach {
                                    testMock.doSomething(with: "Foo")
                                }
                                it("should NOT throw an exception") {
                                    verify(testMock) { (#selector(TestClass.doSomething(with:)), ["Foo"]) }
                                }
                            }

                            context("when there was interaction with mock using anything matcher") {
                                beforeEach {
                                    testMock.doSomething(with: "Bar")
                                }
                                it("should NOT throw an exception") {
                                    verify(testMock) { (#selector(TestClass.doSomething(with:)), matchers: [0: whatever()]) }
                                }
                            }

                            context("when there was interaction with mock using captor matcher") {
                                beforeEach {
                                    testMock.doSomething(with: "Bar")
                                }
                                it("should NOT throw an exception") {
                                    let captor = HCArgumentCaptor()
                                    verify(testMock) { (#selector(TestClass.doSomething(with:)), matchers: [0: captor]) }
                                    let capturedValue = captor.value as! String
                                    expect(capturedValue).to(equal("Bar"))
                                }
                            }

                            context("when there was NO interaction with mock") {

                                var capturedError: Error?

                                beforeEach {
                                    do {
                                        try ObjectiveCException.catch {
                                            verify(testMock) { (#selector(TestClass.doSomething(with:)), ["Foo"]) }
                                        }
                                    } catch (let error) {
                                        capturedError = error
                                    }
                                }

                                it("should throw an exception") {
                                    expect(capturedError).notTo(beNil())
                                }
                            }

                            context("when there was interaction with mock but arguments doesn't match") {

                                var capturedError: Error?

                                beforeEach {
                                    do {
                                        try ObjectiveCException.catch {
                                            verify(testMock) { (#selector(TestClass.doSomething(with:)), ["Bar"]) }
                                        }
                                    } catch (let error) {
                                        capturedError = error
                                    }
                                }

                                it("should throw an exception") {
                                    expect(capturedError).notTo(beNil())
                                }
                            }

                        }

                        context("only primitives") {
                            context("when there was interaction with mock") {
                                beforeEach {
                                    testMock.doSomething(withInt: 123)
                                }
                                it("should NOT throw an exception") {
                                    verify(testMock) { (#selector(TestClass.doSomething(withInt:)), [123]) }
                                }
                            }

                        }

                        context("only boolean") {
                            context("when there was interaction with mock") {
                                beforeEach {
                                    testMock.doSomething(withBoolean: true)
                                }
                                it("should NOT throw an exception") {
                                    verify(testMock) { (#selector(TestClass.doSomething(withBoolean:)), [Bool(true)]) }
                                }
                            }
                        }

                        context("mixed: class type and primitives") {

                        }
                    }
                }


            }

            describe("mocking class") {
                var testMock: TestClass!

                beforeEach {
                    testMock = mock(TestClass.self)
                }
                it("should create mock") {
                    expect(testMock).notTo(beNil())
                }

                describe("verifying public interface method") {

                    context("without arguments") {

                        context("when there was interaction with mock") {
                            beforeEach {
                                testMock.doSomethingNoArguments()
                            }
                            it("should NOT throw an exception") {
                                verify(testMock) { #selector(TestClass.doSomethingNoArguments) }
                            }
                        }

                        context("when there was 1 interaction with mock") {
                            beforeEach {
                                testMock.doSomethingNoArguments()
                            }
                            it("should NOT throw an exception") {
                                verify(testMock, count: 1) { #selector(TestClass.doSomethingNoArguments) }
                            }
                        }

                        context("when there was 3 interaction with mock") {
                            beforeEach {
                                testMock.doSomethingNoArguments()
                                testMock.doSomethingNoArguments()
                                testMock.doSomethingNoArguments()
                            }
                            it("should NOT throw an exception") {
                                verify(testMock, count: 3) { #selector(TestClass.doSomethingNoArguments) }
                            }
                        }

                        context("when there was NO interaction with mock") {

                            var capturedError: Error?

                            beforeEach {
                                do {
                                    try ObjectiveCException.catch {
                                        verify(testMock) { #selector(TestClass.doSomethingNoArguments) }
                                    }
                                } catch (let error) {
                                    capturedError = error
                                }
                            }

                            it("should throw an exception") {
                                expect(capturedError).notTo(beNil())
                            }
                        }

                        context("when there was NO interaction with mock") {

                            it("should verify count 0") {
                                verify(testMock, count: 0) { #selector(TestClass.doSomethingNoArguments) }
                            }
                        }
                    }

                    context("with arguments") {

                        context("only class type") {
                            context("when there was interaction with mock") {
                                beforeEach {
                                    testMock.doSomething(with: "Foo")
                                }
                                it("should NOT throw an exception") {
                                    verify(testMock) { (#selector(TestClass.doSomething(with:)), ["Foo"]) }
                                }
                            }

                            context("when there was NO interaction with mock") {

                                var capturedError: Error?

                                beforeEach {
                                    do {
                                        try ObjectiveCException.catch {
                                            verify(testMock) { (#selector(TestClass.doSomething(with:)), ["Foo"]) }
                                        }
                                    } catch (let error) {
                                        capturedError = error
                                    }
                                }

                                it("should throw an exception") {
                                    expect(capturedError).notTo(beNil())
                                }
                            }

                            context("when there was interaction with mock but arguments doesn't match") {

                                var capturedError: Error?

                                beforeEach {
                                    do {
                                        try ObjectiveCException.catch {
                                            verify(testMock) { (#selector(TestClass.doSomething(with:)), ["Bar"]) }
                                        }
                                    } catch (let error) {
                                        capturedError = error
                                    }
                                }

                                it("should throw an exception") {
                                    expect(capturedError).notTo(beNil())
                                }
                            }

                        }

                        context("only primitives") {
                            context("when there was interaction with mock") {
                                beforeEach {
                                    testMock.doSomething(withInt: 123)
                                }
                                it("should NOT throw an exception") {
                                    verify(testMock) { (#selector(TestClass.doSomething(withInt:)), [123]) }
                                }
                            }

                        }

                        context("mixed: class type and primitives") {

                        }
                    }
                }

                describe("stubbing mock method") {

                    context("with object as return value") {

                        context("with no arguments") {

                            context("that returns an object") {
                                var stubbedReturnValue: String?

                                beforeEach {
                                    given(testMock) { (#selector(TestClass.returnObjectMethodNoArguments), willReturn: "Fake Value")}
                                    stubbedReturnValue = testMock.returnObjectMethodNoArguments()
                                }

                                it("should return value from method") {
                                    expect(stubbedReturnValue).notTo(beNil())
                                }
                                it("should return stubbed value") {
                                    expect(stubbedReturnValue).to(equal("Fake Value"))
                                }
                            }

                            context("that returns an integer") {
                                var stubbedReturnValue: Int?

                                beforeEach {
                                    given(testMock) { (#selector(TestClass.returnIntegerMethodNoArguments), willReturnInt: 123)}
                                    stubbedReturnValue = testMock.returnIntegerMethodNoArguments()
                                }

                                it("should return value from method") {
                                    expect(stubbedReturnValue).notTo(beNil())
                                }
                                it("should return stubbed value") {
                                    expect(stubbedReturnValue).to(equal(123))
                                }
                            }

                            context("that returns an option") {
                                var stubbedReturnValue: TestClassOptions?

                                beforeEach {
                                    given(testMock) { (#selector(TestClass.returnOptionMethodNoArguments), willReturnUInt: TestClassOptions.foo.rawValue) }

                                    stubbedReturnValue = testMock.returnOptionMethodNoArguments()
                                }

                                it("should return value from method") {
                                    expect(stubbedReturnValue).notTo(beNil())
                                    expect(stubbedReturnValue!.rawValue).to(equal(TestClassOptions.foo.rawValue))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
