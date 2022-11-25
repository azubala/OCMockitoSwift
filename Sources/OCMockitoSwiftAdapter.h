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

#import <Foundation/Foundation.h>

@interface OCMockitoSwiftAdapter : NSObject

+ (id)anything;

+ (id)mock:(Class)class;

+ (id)mockProtocol:(Protocol *)protocol;

+ (void)verify:(id)mock
         count:(NSUInteger)executionCount
      selector:(SEL)selector
     arguments:(NSArray *)arguments
      matchers:(NSDictionary *)matchers;

+ (void)given:(id)mock
     selector:(SEL)selector
    arguments:(NSArray *)arguments
     matchers:(NSDictionary *)matchers
   willReturn:(id)returnValue;

+ (void) given:(id)mock
      selector:(SEL)selector
     arguments:(NSArray *)arguments
      matchers:(NSDictionary *)matchers
willReturnBool:(BOOL)returnValue;

+ (void)given:(id)mock
     selector:(SEL)selector
    arguments:(NSArray *)arguments
     matchers:(NSDictionary *)matchers
willReturnInt:(NSInteger)returnValue;

+ (void) given:(id)mock
      selector:(SEL)selector
     arguments:(NSArray *)arguments
      matchers:(NSDictionary *)matchers
willReturnUInt:(NSUInteger)returnValue;

+ (void) given:(id)mock
      selector:(SEL)selector
     arguments:(NSArray *)arguments
      matchers:(NSDictionary *)matchers
        willDo:(id (^)( NSArray *))block;

@end
