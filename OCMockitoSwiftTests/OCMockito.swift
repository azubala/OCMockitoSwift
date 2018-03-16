//
// Copyright (c) 2018 Aleksander Zubala. All rights reserved.
//

import Foundation

func mock<T>(_ type: T.Type) -> T {
    guard let classType = type as? AnyClass else {
        fatalError("Provided type: \(type) is NOT AnyClass!")
    }
    return OCMockitoSwiftAdapter.mock(classType) as! T
}

func mockProtocol(_ type: Protocol) -> Any  {
    return OCMockitoSwiftAdapter.mockProtocol(type)
}

func verify(_ mock: Any, closure: () -> (Selector, arguments: [Any])) {
    let (sel, arguments) = closure()
    OCMockitoSwiftAdapter.verify(mock, selector: sel, arguments: arguments)
}

func verify(_ mock: Any, closure: () -> (Selector)) {
    let selector = closure()
    OCMockitoSwiftAdapter.verify(mock, selector: selector, arguments: [])
}

func given(_ mock: Any, closure: () -> (Selector, arguments: [Any], willReturn: Any)) {
    let (sel, args, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: args, willReturn: returnValue)
}

func given(_ mock: Any, closure: () -> (Selector, willReturn: Any)) {
    let (sel, returnValue) = closure()
    OCMockitoSwiftAdapter.given(mock, selector: sel, arguments: [], willReturn: returnValue)
}