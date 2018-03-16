import Quick
import Nimble

class OCMockitoSwiftSpec: QuickSpec {
    override func spec() {
        
        describe("OCMockitoSwift") {

            describe("mocking protocol") {

                var testMock: TestProtocol!

                beforeEach {
                    testMock = mockProtocol(TestProtocol.self) as! TestProtocol
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
                    }
                }
            }
        }
    }
}
