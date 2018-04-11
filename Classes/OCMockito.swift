//
//    Copyright © 2018 Aleksander Zubala. All rights reserved.
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in
//    all copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//    THE SOFTWARE.

import Foundation

public func whatever() -> Any {
    return OCMockitoSwiftAdapter.anything()
}

public func mock<T>(_ type: T.Type) -> T {
    guard let classType = type as? AnyClass else {
        fatalError("Provided type: \(type) is NOT AnyClass!")
    }
    return OCMockitoSwiftAdapter.mock(classType) as! T
}

public func mockProtocol(_ type: Protocol) -> Any {
    return OCMockitoSwiftAdapter.mockProtocol(type)
}

public func mockClass(_ type: AnyClass) -> Any {
    return OCMockitoSwiftAdapter.mockClass(type)
}

public func verify(_ mock: Any, count: UInt = 1, closure: () -> (Selector)) {
    let selector = closure()
    OCMockitoSwiftAdapter.verify(mock, count: count, selector: selector, arguments: [], matchers: [:])
}

public func verify(_ mock: Any, count: UInt = 1, closure: () -> (Selector, arguments: [Any])) {
    let (sel, arguments) = closure()
    OCMockitoSwiftAdapter.verify(mock, count: count, selector: sel, arguments: arguments, matchers: [:])
}

public func verify(_ mock: Any, count: UInt = 1, closure: () -> (Selector, matchers: [Int: Any])) {
    let (sel, matchers) = closure()
    OCMockitoSwiftAdapter.verify(mock, count: count, selector: sel, arguments: [], matchers: matchers)
}

public func verify(_ mock: Any, count: UInt = 1, closure: () -> (Selector, arguments: [Any], matchers: [Int: Any])) {
    let (sel, arguments, matchers) = closure()
    OCMockitoSwiftAdapter.verify(mock, count: count, selector: sel, arguments: arguments, matchers: matchers)
}

public func given(_ mock: Any, closure: () -> (Selector, arguments: [Any], willReturn: Any)) {
    let (sel, args, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: args, matchers: [:], willReturn: returnValue)
}

public func given(_ mock: Any, closure: () -> (Selector, willReturn: Any)) {
    let (sel, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: [], matchers: [:], willReturn: returnValue)
}

public func given(_ mock: Any, closure: () -> (Selector, arguments: [Any], willReturnInt: Int)) {
    let (sel, args, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: args, matchers: [:], willReturnInt: returnValue)
}

public func given(_ mock: Any, closure: () -> (Selector, willReturnInt: Int)) {
    let (sel, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: [], matchers: [:], willReturnInt: returnValue)
}

public func given(_ mock: Any, closure: () -> (Selector, arguments: [Any], willReturnUInt: UInt)) {
    let (sel, args, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: args, matchers: [:], willReturn: returnValue)
}

public func given(_ mock: Any, closure: () -> (Selector, willReturnUInt: UInt)) {
    let (sel, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: [], matchers: [:], willReturn: returnValue)
}

public func given(_ mock: Any, closure: () -> (Selector, arguments: [Any], willReturnBool: Bool)) {
    let (sel, args, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: args, matchers: [:], willReturn: returnValue)
}

public func given(_ mock: Any, closure: () -> (Selector, willReturnBool: Bool)) {
    let (sel, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: [], matchers: [:], willReturn: returnValue)
}
