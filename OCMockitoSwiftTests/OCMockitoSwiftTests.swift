import Quick
import Nimble

class OCMockitoSwiftSpec: QuickSpec {
    override func spec() {
        
        describe("OCMockitoSwift") {
            
            var testMock: TestClass!
            
            describe("mocking class") {
                beforeEach {
                    testMock = OCMockitoSwift.mock(TestClass.self) as? TestClass
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
                                OCMockitoSwift.verify(testMock,
                                                      selector: #selector(TestClass.doSomethingNoArguments))
                            }
                        }

                        context("when there was NO interaction with mock") {

                            var capturedError: Error?

                            beforeEach {
                                do {
                                    try ObjectiveCException.catch {
                                        OCMockitoSwift.verify(testMock,
                                                              selector: #selector(TestClass.doSomethingNoArguments))
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
                                    OCMockitoSwift.verify(testMock,
                                                          selector: #selector(TestClass.doSomething(with:)),
                                                          arguments: ["Foo"])
                                }
                            }

                            context("when there was NO interaction with mock") {

                                var capturedError: Error?

                                beforeEach {
                                    do {
                                        try ObjectiveCException.catch {
                                            OCMockitoSwift.verify(testMock,
                                                                  selector: #selector(TestClass.doSomething(with:)),
                                                                  arguments: ["Foo"])
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
                                            OCMockitoSwift.verify(testMock,
                                                                  selector: #selector(TestClass.doSomething(with:)),
                                                                  arguments: ["Bar"])
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
                                fit("should NOT throw an exception") {
                                    OCMockitoSwift.verify(testMock,
                                                          selector: #selector(TestClass.doSomething(withInt:)),
                                                          arguments: [123])
                                }
                            }

                        }

                        context("mixed: class type and primitives") {

                        }
                    }
                }
            }
        }
    }
}
