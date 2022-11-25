# OCMockitoSwift

## Disclaimer

This library is work in progress, only bare minimum is provided from OCMockito.

## About

[**OCMockito**](https://github.com/jonreid/OCMockito) adapter for Swift, that allows to create and operate on mocks which are subclasses for `NSObject`.

The adapter comes with two files:

- `OCMockitoSwiftAdapter.{h,m}` -- Objective-C code to provide Swift friendly interface that allows mocking, veryfing and stubbing
- `OCMockito.swift` -- set of global functions for Swift, e.g. `mock()` or `verify()`

## Installation

### Cocoapods

Simply add to your `Podfile`:

```
pod 'OCMockitoSwift', '~> 0.3'
```

### Carthage

Simply add to your `Cartfile`:

```
github "azubala/OCMockitoSwift"
```

### Swift Package Manager

Add the following to the `dependencies` value of your `Package.swift`:

```
dependencies: [
    .package(url: "https://github.com/azubala/OCMockitoSwift", .upToNextMajor(from: 0.8.0"))
]
```

## Examples

### Creating mocks

To create a mock of an `NSObject` subclass simply call:

```swift
let mock = mock(MyObject.self)  // no casting needed
``` 

To create a mock of an Objective-C protocol that extends `NSObject` protocol you execute the following:

```swift
let mock = mockProtocol(MyProtocol.self) as? MyProtocol // casting required :(
```

### Verifying behavior

To verify if there were interaction with the mock you use the `verify` global function:

```swift

verify(mock) { #selector(MyObject.doSomethingNoArguments) } // method without arguments

verify(mock) { (#selector(MyObject.doSomething(with:)), arguments: ["Foo"]) } // method with arguments

```

To verify count of the mock interaction simply use `count` parameter (by default it's set to 1). For example to verify that there were no interactions with mock you can simply call:

```swift
verify(testMock, count: 0) { #selector(TestClass.doSomethingNoArguments) }
```

Working with [OCHamcrest](https://github.com/hamcrest/OCHamcrest) matchers:

```swift

// provide map of matchers for each argument index; `whatever()` is equivalent of `anything()`

verify(testMock) { (#selector(TestClass.doSomething(with:)), matchers: [0: whatever()]) } 

// Capturing arguments

var captor = HCArgumentCaptor()

verify(testMock) { (#selector(TestClass.doSomething(with:)), matchers: [0: captor]) }

var capturedValue = captor.value as! String
expect(capturedValue).to(equal("Bar"))

```


### Stubbing mocks

To stub return value of a particular method from mock you use the `given` global function:

```swift

given(mock) { (#selector(MyObject.returnObjectMethodNoArguments), willReturn: "Fake Value")} // method without arguments

given(mock) { (#selector(MyObject.returnSomething(with:)), arguments: ["Foo"], willReturn: "Fake Value")} // method with arguments

```

To stub using closure use `willDo:` parameter:

```swift
given(testMock) { (#selector(MyObject.returnIntegerMethodNoArguments), willDo: { _ in
    return 42
})}
```

## Author

[Aleksander Zubala](mailto:alek@zubala.com) | [**zubala.com**](http://zubala.com)

## License

**OCMockitoSwift** is available under the MIT license. See the LICENSE file for more info.
